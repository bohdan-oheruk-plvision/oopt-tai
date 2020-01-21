# Copyright 2019-present Open Networking Foundation
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

workspace(name = "com_github_telecominfraproject_oopt_tai")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "io_bazel_rules_python",
    remote = "https://github.com/bazelbuild/rules_python.git",
    commit = "8b5d0683a7d878b28fffe464779c8a53659fc645",
)

load("@io_bazel_rules_python//python:pip.bzl", "pip_import", "pip_repositories")

pip_repositories()

pip_import(
    name = "tai_meta_deps",
    requirements = "//:pip-requirements.txt"
)
load("@tai_meta_deps//:requirements.bzl", meta_deps_pip_install = "pip_install")
meta_deps_pip_install()

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_grpc_grpc",
    urls = [
        "https://github.com/grpc/grpc/archive/99fd5c391a435e2677b6caa7fd25089c484a32ab.tar.gz",
    ],
    strip_prefix = "grpc-99fd5c391a435e2677b6caa7fd25089c484a32ab",
)

http_archive(
    name = "build_stack_rules_proto",
    urls = ["https://github.com/stackb/rules_proto/archive/2f4e4f62a3d7a43654d69533faa0652e1c4f5082.tar.gz"],
    strip_prefix = "rules_proto-2f4e4f62a3d7a43654d69533faa0652e1c4f5082",
)

load("@build_stack_rules_proto//python:deps.bzl", "python_grpc_library")
python_grpc_library()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")
grpc_deps()

pip_import(
    name = "protobuf_py_deps",
    requirements = "@build_stack_rules_proto//python/requirements:protobuf.txt",
)
load("@protobuf_py_deps//:requirements.bzl", protobuf_pip_install = "pip_install")
protobuf_pip_install()

pip_import(
    name = "grpc_py_deps",
    requirements = "@build_stack_rules_proto//python:requirements.txt",
)
load("@grpc_py_deps//:requirements.bzl", grpc_pip_install = "pip_install")
grpc_pip_install()
