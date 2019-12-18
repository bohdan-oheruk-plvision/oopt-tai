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
