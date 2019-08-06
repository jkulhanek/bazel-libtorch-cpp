workspace(name = "bazel_libtorch_cpp")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "libtorch_archive",
    strip_prefix = "torch",
    sha256 = "f5a33910a2d2932b3224788dfdfab5ba7dd972ec8a3488bf92be63ae30a54591",
    type = "zip",
    urls = ["https://download.pytorch.org/whl/cu100/torch-1.1.0-cp36-cp36m-linux_x86_64.whl"],
    build_file = "@//:libtorch.BUILD"
)

'''new_local_repository(
    name = "libtorch_archive",
    build_file = "@//:libtorch.BUILD",
    path = "/home/jonas/Downloads/libtorch",
)'''



