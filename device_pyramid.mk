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

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/pyramid/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

PRODUCT_COPY_FILES += \
    device/htc/pyramid/init.pyramid.rc:root/init.pyramid.rc \
    device/htc/pyramid/ueventd.pyramid.rc:root/ueventd.pyramid.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/shooter/shooter-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects

DEVICE_PACKAGE_OVERLAYS += device/htc/pyramid/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

#PRODUCT_PACKAGES += \
#    gps.pyramid \
#    librs_jni \
#    gralloc.msm8660 \
#    copybit.msm8660 \
#    overlay.default \
#    com.android.future.usb.accessory
    
PRODUCT_PACKAGES += \
    librs_jni

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/pyramid/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/pyramid/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/pyramid/keychars/pyramid-keypad.kcm.bin:system/usr/keychars/pyramid-keypad.kcm.bin \
    device/htc/pyramid/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/pyramid/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/pyramid/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/pyramid/keylayout/pyramid-keypad.kl:system/usr/keylayout/pyramid-keypad.kl \
    device/htc/pyramid/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/pyramid/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl
# Firmware
PRODUCT_COPY_FILES += \
    device/htc/pyramid/firmware/BCM4329B1_002.002.023.0589.0632.hcd:system/etc/firmware/BCM4329B1_002.002.023.0589.0632.hcd \
    device/htc/pyramid/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/pyramid/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    device/htc/pyramid/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/htc/pyramid/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/pyramid/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw

# Wifi Module
PRODUCT_COPY_FILES += \
    device/htc/pyramid/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# device uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/htc/pyramid/vold.fstab:system/etc/vold.fstab


$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product-if-exists, vendor/htc/pyramid/pyramid-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/pyramid/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/pyramid/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# media profiles and capabilities spec
$(call inherit-product, device/htc/pyramid/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/pyramid/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := full_pyramid
PRODUCT_DEVICE := pyramid
PRODUCT_MODEL := HTC Sensation
PRODUCT_MANUFACTURER := HTC
