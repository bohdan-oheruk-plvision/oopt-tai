load("@tai_meta_deps//:requirements.bzl", "requirement")


py_binary(
    name = "taish",
    srcs = ["taish.py"],
    deps = [
        "//tools/taish:tai_py_grpc",
        requirement("prompt_toolkit"),
        requirement("wcwidth"),
        requirement("tabulate"),
    ],
    imports = [
        "../",
    ],
    visibility = [ '//visibility:public' ],
)