cc_library(
    name = "torch",
    srcs = [
        "lib/libtorch.so",
        "lib/libc10.so",
        "lib/libcaffe2.so",
        "lib/libcaffe2_gpu.so",
        "lib/libc10_cuda.so"
    ],
    linkopts = [
        "-lcuda", 
        "-ltorch",
        "-lcaffe2",
        "-lc10",
        "-lcaffe2_gpu",
        "-lc10_cuda",
    ],
    hdrs = glob(["include/**/*.h"]),
    includes = [
        "include",
        "include/torch/csrc/api/include",
        "include/THC",
        "include/TH",
    ],
    copts = ["-D_GLIBCXX_USE_CXX11_ABI=0"],
    visibility = ["//visibility:public"]
)

cc_library(
    name = "torch_cpu",
    srcs = [
        "lib/libtorch.so",
        "lib/libc10.so",
        "lib/libcaffe2.so",
    ],
    linkopts = [
        "-ltorch",
        "-lcaffe2",
        "-lc10",
    ],
    hdrs = glob(["include/**/*.h"]),
    includes = [
        "include",
        "include/torch/csrc/api/include",
        "include/THC",
        "include/TH",
    ],
    copts = ["-D_GLIBCXX_USE_CXX11_ABI=0"],
    visibility = ["//visibility:public"]
)