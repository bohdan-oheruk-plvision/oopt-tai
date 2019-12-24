# Copyright 2019-present Open Networking Foundation
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

LIBCLANG_PATH="/usr/lib/llvm-10/lib/libclang.so.1"
exports_files(["pip-requirements.txt"])

load("@tai_meta_deps//:requirements.bzl", meta_all_requirements = "all_requirements")

py_binary(
    name = "main",
    srcs = ["meta/main.py"],
    deps = depset(meta_all_requirements).to_list(),
)

cc_library (
    name = "tai_hdrs",
    hdrs = [
        "inc/tai.h",
        "inc/taihostif.h",
        "inc/taimodule.h",
        "inc/tainetworkif.h",
        "inc/taistatus.h",
        "inc/taitypes.h"
    ],
)

genrule(
    name = "taimetadata_c",
    cmd = "$(location :main) --clang-lib " + LIBCLANG_PATH + " $(location inc/tai.h) && mv taimetadata.c $(@D)",
    outs = [
        "taimetadata.c",
    ],
    tools = [
        ":main", 
        "inc/tai.h",
        "inc/taihostif.h",
        "inc/taimodule.h",
        "inc/tainetworkif.h",
        "inc/taistatus.h",
        "inc/taitypes.h",
    ]
)

genrule(
    name = "taimetadata_h",
    cmd = "$(location :main) --clang-lib " + LIBCLANG_PATH + " $(location inc/tai.h) && mv taimetadata.h $(@D)",
    outs = [
        "taimetadata.h",
    ],
    tools = [
        ":main", 
        "inc/tai.h",
        "inc/taihostif.h",
        "inc/taimodule.h",
        "inc/tainetworkif.h",
        "inc/taistatus.h",
        "inc/taitypes.h",
    ]
)

cc_library(
    name = "metatai",
    srcs = [
        ":taimetadata_c",
        "meta/taiserialize.c",
        "meta/cJSON.c",
        "meta/taimetadatautils.c",
    ],
    hdrs = [
        ":taimetadata_h",
        "meta/taimetadatatypes.h",
        "meta/taimetadatautils.h",
        "meta/cJSON.h",
        "meta/taimetadatalogger.h",
        "meta/taiserialize.h",
    ],
    deps = [
        ":tai_hdrs"
    ],
    copts = [
        "-fPIC",
    ],
    includes = [
        "inc/",
        "meta/",
    ],
    
    visibility = [ '//visibility:public' ],
)
