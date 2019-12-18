#
# Copyright 2019-present Open Networking Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
    name = "meta_deps",
    requirements = "//:pip-requirements.txt"
)

load("@meta_deps//:requirements.bzl", meta_deps_pip_install = "pip_install")

meta_deps_pip_install()
