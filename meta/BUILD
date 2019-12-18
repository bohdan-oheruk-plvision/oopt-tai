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

load("@meta_deps//:requirements.bzl", meta_all_requirements = "all_requirements")

licenses(["notice"])  # Apache v2

package(
    default_visibility = ["//visibility:public"],
)

py_binary(
    name = "main",
    srcs = ["main.py"],
    deps = depset(meta_all_requirements).to_list(),
    python_version = "PY3",
)

genrule(
    name = "taimetadata_c",
    srcs = [
            "//inc:tai.h",
            "//inc:taihostif.h",
            "//inc:taimodule.h",
            "//inc:tainetworkif.h",
            "//inc:taistatus.h",
            "//inc:taitypes.h",
    ],
    cmd = "$(location :main) --clang-lib /usr/lib/llvm-10/lib/libclang.so.1 inc/tai.h && mv taimetadata.c $(@D)",
    outs = [
        "taimetadata.c",
    ],
    tools = [":main"]
)

genrule(
    name = "taimetadata_h",
    srcs = [
            "//inc:tai.h",
            "//inc:taihostif.h",
            "//inc:taimodule.h",
            "//inc:tainetworkif.h",
            "//inc:taistatus.h",
            "//inc:taitypes.h",
    ],
    cmd = "$(location :main) --clang-lib /usr/lib/llvm-10/lib/libclang.so.1 inc/tai.h && mv taimetadata.h $(@D)",
    outs = [
        "taimetadata.h",
    ],
    tools = [":main"]
)

cc_library(
    name = "taimetadata",
    srcs = [
        ":taimetadata_c",
        "taiserialize.c",
        "taimetadatautils.c",
        "cJSON.c"
    ],
    hdrs = [
        ":taimetadata_h",
        "//inc:tai.h",
        "//inc:taihostif.h",
        "//inc:taimodule.h",
        "//inc:tainetworkif.h",
        "//inc:taistatus.h",
        "//inc:taitypes.h",
    ] + glob(["*.h"]),
    copts = [
        "-fPIC",
    ]
)
