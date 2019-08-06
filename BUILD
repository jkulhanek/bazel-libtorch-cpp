cc_binary(
    name = "example",
    srcs = ["src/example.cpp"],
    copts = ["-D_GLIBCXX_USE_CXX11_ABI=0"],
    deps = [
        "@libtorch_archive//:torch_gpu",
    ],
)