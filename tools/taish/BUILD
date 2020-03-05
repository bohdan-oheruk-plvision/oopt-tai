load("@com_github_grpc_grpc//bazel:cc_grpc_library.bzl", "cc_grpc_library")
load("@com_github_grpc_grpc//bazel:python_rules.bzl", "py_grpc_library", "py_proto_library")

proto_library(
    name = "tai_proto",
    srcs = ["proto/tai.proto"],
    visibility = [ '//visibility:public' ],
)

cc_proto_library(
    name = "tai_cc_proto",
    deps = [":tai_proto"],
)

cc_grpc_library(
    name = "tai_cc_grpc",
    deps = [":tai_cc_proto"],
    srcs = [":tai_proto"],
    grpc_only = True,
)

cc_library(
    name = "taish_lib",
    srcs = [
        "server/json.hpp",
        "server/main.cpp",
        "lib/server.cpp",
        "include/taigrpc.hpp",
    ],
    deps = [
        "@com_github_grpc_grpc//:grpc++",
        ":tai_cc_grpc",
        "//:libmetatai",
        "//:meta_hdrs",
        "//:tai_hdrs",
    ],
    includes = [
        "include/",
        "proto/",
    ],
    visibility = [ '//visibility:public' ],
)

cc_binary(
    name = "taish_stub",
    deps = [
        ":taish_lib",
        "//:libtai-stub",
    ],
)

py_proto_library(
    name = "tai_py_proto",
    deps = [":tai_proto"]
)

py_grpc_library(
    name = "tai_py_grpc",
    srcs = [":tai_proto"],
    deps = [":tai_py_proto"],
    visibility = [ '//visibility:public' ],
)