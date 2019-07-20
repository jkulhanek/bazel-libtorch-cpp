load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

script_template = """
#!/bin/bash
LD_LIBRARY_PATH="{torch_path}/lib:$LD_LIBRARY_PATH" {executable}
"""

def _torch_with_runtime_impl(ctx):
    # Emit the executable shell script.
    script = ctx.actions.declare_file("%s-torch" % ctx.label.name)
    script_content = script_template.format(
        executable = ctx.files.srcs[0].short_path,
        torch_path = "/opt/libtorch",
    )
    ctx.actions.write(script, script_content, is_executable = True)
    runfiles = ctx.runfiles(files = [ctx.files.srcs[0]])

    #print(ctx.files.libtorch[0].dirname)

    return [DefaultInfo(executable = script, runfiles = runfiles)]

_torch_with_runtime = rule(
    implementation = _torch_with_runtime_impl,
    attrs = {
        "srcs": attr.label_list(
            allow_files = True,
        ),
        "libtorch": attr.label(
            allow_single_file = True
        ),
    },
    executable = True,
)

def torch_executable(name, libtorch, binary = None, cache_entries = dict(), **kwargs):
    ce = dict()    
    ce.update({
        "CMAKE_MACOSX_RPATH": "True",
        "CMAKE_PREFIX_PATH":"/opt/libtorch",
    })
    ce.update(cache_entries)
    if binary == None:
        binary = name

    cmake_external(
        name = (name + "_library"), 
        cache_entries = ce,
        binaries = select({
            "@bazel_tools//src/conditions:windows": [binary + ".exe"],
            "@bazel_tools//src/conditions:darwin": [binary],
            "//conditions:default": [binary],
        }),
        **kwargs
    )
    native.filegroup(
        name = name + "_binary_file",
        srcs = [":" + name + "_library"],
        output_group = binary,
    )

    _torch_with_runtime(
        name = name,
        srcs = [
            ":" + name + "_binary_file"
        ],
        libtorch = libtorch,
    )

    