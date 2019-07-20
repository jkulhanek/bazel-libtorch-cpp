filegroup(
    name = "srcs",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)

load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")
load("//:torch.bzl", "torch_executable")


torch_executable(
    name = "example",
    binary = "example",
    lib_source = ":srcs",
    libtorch = "@libtorch_archive//:lib/."
)

