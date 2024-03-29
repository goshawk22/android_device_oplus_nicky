#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Inherit from nicky device
$(call inherit-product, device/oplus/nicky/device.mk)

PRODUCT_NAME := aosp_nicky
PRODUCT_DEVICE := nicky
PRODUCT_MANUFACTURER := oplus
PRODUCT_BRAND := realme
PRODUCT_MODEL := nicky

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sargo-user 12 SP2A.220405.003 8210211 release-keys"

BUILD_FINGERPRINT := google/sargo/sargo:12/SP2A.220405.003/8210211:user/release-keys
