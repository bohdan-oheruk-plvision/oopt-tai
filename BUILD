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
        "inc/taitypes.h",
    ],
    includes = [
        "inc/",
    ],
    visibility = [ '//visibility:public' ],
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

#--------------------------------------------------------
cc_binary(
    name = "libtai-stub.so",
    srcs = [
        "stub/stub_tai.c",
    ],
    deps = [
        ":libmetatai",
    ],
    includes = [
        "inc/",
        "meta/",
    ],
    linkshared = True,
    visibility = [ '//visibility:public' ],
)

cc_import(
    name = "libtai-stub",
    shared_library = "libtai-stub.so",
    visibility = [ '//visibility:public' ],
)
#--------------------------------------------------------

cc_library(
    name = "meta_hdrs",
    hdrs = [
        ":taimetadata_h",
        "meta/taimetadatatypes.h",
        "meta/taimetadatautils.h",
        "meta/cJSON.h",
        "meta/taimetadatalogger.h",
        "meta/taiserialize.h",
    ],
    includes = [
        "meta/",
    ],
    visibility = [ '//visibility:public' ],
)

cc_binary(
    name = "libmetatai.so",
    srcs = [
        ":taimetadata_c",
        "meta/taiserialize.c",
        "meta/cJSON.c",
        "meta/taimetadatautils.c",
    ],
    deps = [
        ":tai_hdrs",
        ":meta_hdrs",
    ],
    linkshared = True,
    includes = [
        "inc/",
        "meta/",
    ],
    
    visibility = [ '//visibility:public' ],
)

cc_import(
    name = "libmetatai",
    hdrs = [
        ":taimetadata_h",
        "meta/taimetadatatypes.h",
        "meta/taimetadatautils.h",
        "meta/cJSON.h",
        "meta/taimetadatalogger.h",
        "meta/taiserialize.h",
        "inc/tai.h",
        "inc/taihostif.h",
        "inc/taimodule.h",
        "inc/tainetworkif.h",
        "inc/taistatus.h",
        "inc/taitypes.h",
    ],
    shared_library = "libmetatai.so",
    visibility = [ '//visibility:public' ],
)

cc_binary(
    name = "test",
    srcs = [
        "test/test.c",
    ],
    deps = [
        ":libmetatai",
        ":libtai-stub",
    ],
    includes = [
        "inc/",
        "meta/",
    ],
)

cc_library(
    name = "help_lib",
    hdrs = [
        "tools/lib/attribute.hpp",
        "tools/lib/exception.hpp",
        "tools/lib/logger.hpp",
    ],
    srcs = [
        "tools/lib/attribute.cpp",
    ],
    includes = [
        "tools/lib/",
    ],
    deps = [
        # "@com_github_oopt_tai//:libmetatai",
        ":tai_hdrs",
        ":meta_hdrs",
    ],
    visibility = [ "//visibility:public" ],
)

cc_library(
    name = "tai_framework",
    hdrs = [
        "tools/framework/config.hpp",
        "tools/framework/fsm.hpp",
        "tools/framework/object.hpp",
        "tools/framework/platform.hpp",
        # "oopt-tai/tools/framework/examples/basic/basic.hpp",
    ],
    srcs = [
        # "oopt-tai/tools/framework/tai.cpp",
        # "oopt-tai/tools/framework/examples/basic/basic.cpp",
    ],
    includes = [
        "tools/framework/",
        # "oopt-tai/tools/framework/examples/basic",
    ],
    deps = [
        ":tai_hdrs",
        ":meta_hdrs",
        ":help_lib",
    ],
    linkopts = [
        "-fno-gnu-unique",
    ],
    visibility = [ "//visibility:public" ],
)
