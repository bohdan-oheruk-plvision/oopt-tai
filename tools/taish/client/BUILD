load("@build_stack_rules_proto//python:python_grpc_library.bzl", "python_grpc_library")

load("@tai_meta_deps//:requirements.bzl", "requirement")

python_grpc_library(
    name = "taish_py_grpc",
    deps = ["//tools/taish:tai_proto"],
)

py_binary(
    name = "taish",
    srcs = ["taish.py"],
    deps = [
        ":taish_py_grpc",
        requirement("prompt_toolkit"),
        requirement("wcwidth"),
        requirement("tabulate"),
    ],
    imports = [
        "../proto",
    ]
)