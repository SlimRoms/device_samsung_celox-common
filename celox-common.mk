#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/celox-common/celox-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/celox-common/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# F2FS
PRODUCT_PACKAGES += \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/bcm4330B1.hcd:system/etc/firmware/bcm4330B1.hcd

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Ril props
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    ro.ril.transmitpower=true \
    telephony.lteOnGsmDevice=1

# Data modules props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd=true \
    persist.data_netmgrd_nint=16

# SdCard emulation prop
PRODUCT_PROPERTY_OVERRIDES += \
    ro.emmc.sdcard.partition=17

# Radio system props
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.adb_log_on=1 \
    persist.radio.add_power_save=1 \
    persist.radio.snapshot_disabled=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc

# common msm8660
$(call inherit-product, device/samsung/msm8660-common/msm8660.mk)
