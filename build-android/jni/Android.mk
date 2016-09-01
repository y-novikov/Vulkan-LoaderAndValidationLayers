# Copyright 2015 The Android Open Source Project
# Copyright (C) 2015 Valve Corporation

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(abspath $(call my-dir))
SRC_DIR := $(LOCAL_PATH)/../..
LAYER_DIR := $(LOCAL_PATH)/../generated

# specific for NDK build
SHADERC_DIR := $(SRC_DIR)/../shaderc
GLSLANG_DIR := $(SHADERC_DIR)/glslang
SPIRV_TOOLS_DIR := $(SHADERC_DIR)/spirv-tools

include $(CLEAR_VARS)
LOCAL_MODULE := layer_utils
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_config.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_extension_utils.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_utils.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(SRC_DIR)/loader
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_core_validation
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/core_validation/core_validation.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/core_validation/descriptor_sets.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_table.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/unique_objects/vk_safe_struct.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(LAYER_DIR)/include \
                    $(SRC_DIR)/loader
LOCAL_STATIC_LIBRARIES += layer_utils glslang SPIRV-Tools
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_LDLIBS    := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_image
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/image/image.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_table.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(LAYER_DIR)/include \
                    $(SRC_DIR)/loader
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_LDLIBS    := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_parameter_validation
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/parameter_validation/parameter_validation.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_table.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(LAYER_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(SRC_DIR)/loader
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_LDLIBS    := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_object_tracker
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/object_tracker/object_tracker.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_table.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(LAYER_DIR)/include \
                    $(SRC_DIR)/loader
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_LDLIBS    := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_threading
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/threading/threading.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_table.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(LAYER_DIR)/include \
                    $(SRC_DIR)/loader
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_LDLIBS    := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_unique_objects
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/unique_objects/unique_objects.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/unique_objects/vk_safe_struct.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_table.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(LAYER_DIR)/include \
                    $(SRC_DIR)/loader
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_LDLIBS    := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := VkLayer_swapchain
LOCAL_SRC_FILES += $(LAYER_DIR)/layer-src/swapchain/swapchain.cpp
LOCAL_SRC_FILES += $(LAYER_DIR)/common/vk_layer_table.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(LAYER_DIR)/include \
                    $(SRC_DIR)/loader
LOCAL_STATIC_LIBRARIES += layer_utils
LOCAL_CPPFLAGS += -std=c++11 -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_LDLIBS    := -llog
include $(BUILD_SHARED_LIBRARY)

# Note: The following module is similar in name to the executable, but differs so that loader won't enumerate the resulting .so
include $(CLEAR_VARS)
LOCAL_MODULE := VulkanLayerValidationTests
LOCAL_SRC_FILES += $(SRC_DIR)/tests/layer_validation_tests.cpp \
                   $(SRC_DIR)/tests/vktestbinding.cpp \
                   $(SRC_DIR)/tests/vktestframeworkandroid.cpp \
                   $(SRC_DIR)/tests/vkrenderframework.cpp \
                   $(SRC_DIR)/common/vulkan_wrapper.cpp
LOCAL_C_INCLUDES += $(SRC_DIR)/include \
                    $(SRC_DIR)/layers \
                    $(SRC_DIR)/libs \
                    $(SRC_DIR)/common \
                    $(SRC_DIR)/icd/common

LOCAL_STATIC_LIBRARIES := googletest_main layer_utils
LOCAL_SHARED_LIBRARIES += shaderc glslang OGLCompiler OSDependent HLSL shaderc_util SPIRV SPIRV-Tools
LOCAL_CPPFLAGS += -DVALIDATION_APK --include=$(SRC_DIR)/common/vulkan_wrapper.h
LOCAL_CPPFLAGS += -Wall -Werror -Wno-unused-function -Wno-unused-const-variable -mxgot
LOCAL_CPPFLAGS += -DVK_USE_PLATFORM_ANDROID_KHR -DVK_PROTOTYPES
LOCAL_WHOLE_STATIC_LIBRARIES += android_native_app_glue
LOCAL_LDLIBS := -llog -landroid
include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/native_app_glue)
$(call import-module,third_party/googletest)
$(call import-module,third_party/shaderc)

