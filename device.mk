LOCAL_PATH := device/realme/nashc

# Keystore
PRODUCT_PACKAGES += \
    android.system.keystore2

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd
TW_INCLUDE_FASTBOOTD := true

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
# SPDX-License-Identifier: Apache-2.0
