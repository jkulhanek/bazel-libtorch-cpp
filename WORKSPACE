workspace(name = "bazel_libtorch_cpp")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
   name = "rules_foreign_cc",
   strip_prefix = "rules_foreign_cc-master",
   url = "https://github.com/bazelbuild/rules_foreign_cc/archive/master.zip",
)

load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies(["//:built_cmake_toolchain"])
new_local_repository(
    name = "libtorch_archive",
    path = "/opt/libtorch",
    build_file = "@//:libtorch.BUILD"
)

