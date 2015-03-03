#
# Copyright (C) 2015 The Android Open-Source Project
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
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

PRODUCT_NAME := odrc
PRODUCT_DEVICE := odrc
PRODUCT_BRAND := AndroidTV
PRODUCT_MODEL := AndroidTV on odrc
PRODUCT_MANUFACTURER := aml

PRODUCT_AAPT_CONFIG := normal tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_PACKAGES += \
    libEGL_mali \
    libGLESv1_CM_mali \
    libGLESv2_mali \
    egl.cfg \
    gralloc.$(TARGET_PRODUCT) \
    hwcomposer.$(TARGET_PRODUCT)

PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
    device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/odrc_core_hardware.xml:system/etc/permissions/odrc_core_hardware.xml \
    $(LOCAL_PATH)/init.odrc.rc:root/init.odrc.rc \
    $(LOCAL_PATH)/ueventd.odrc.rc:root/ueventd.odrc.rc \
    $(LOCAL_PATH)/fstab.odrc:root/fstab.odrc \
    $(LOCAL_PATH)/set_display_mode.sh:system/bin/set_display_mode.sh \
    kernel/hardware/arm/gpu/mali/mali.ko:root/lib/modules/mali.ko \
    $(PRODUCT_COPY_FILES)

DEVICE_PACKAGE_OVERLAYS := device/aml/odrc/overlay
PRODUCT_CHARACTERISTICS := tablet,nosdcard
PRODUCT_LOCALES := en_US,ko_KR,ja_JP,zh_CN
