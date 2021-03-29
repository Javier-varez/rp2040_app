LOCAL_DIR := $(call current-dir)

include $(CLEAR_VARS)
LOCAL_NAME := rp2040_app
LOCAL_CFLAGS := \
    -mcpu=cortex-m0 \
    -mfloat-abi=soft \
    -mthumb \
    -Os \
    -g3 \
    -I$(LOCAL_DIR)/inc \
    -Wall \
    -Werror \
    -Wextra \
    -Wno-gnu-string-literal-operator-template
LOCAL_CXXFLAGS := \
    $(LOCAL_CFLAGS) \
    -std=gnu++17 \
    -fno-exceptions \
    -fno-rtti \
    -ffunction-sections \
    -fdata-sections
LOCAL_LDFLAGS := \
    -Wl,--gc-sections
LOCAL_LINKER_FILE := \
    $(LOCAL_DIR)/memory.ld
LOCAL_SRC := \
    $(LOCAL_DIR)/src/main.cpp \
    $(LOCAL_DIR)/src/bs2_default_padded_checksummed.s
LOCAL_ARM_ARCHITECTURE := v6-m
LOCAL_ARM_FPU := nofp
LOCAL_COMPILER := arm_clang
LOCAL_CROSS_COMPILE := arm-none-eabi-
LOCAL_STATIC_LIBS := \
    libcortex_m_startup
include $(BUILD_BINARY)

