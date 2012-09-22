# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.



# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.

# Telephony property for CDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.numeric=310120 \
    ro.cdma.home.operator.alpha=Sprint \
    ro.telephony.default_network=4

# WiMAX Property setting for checking WiMAX interface
PRODUCT_PROPERTY_OVERRIDES += \
       ro.wimax.interface=uwbr0

# Hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    device/samsung/crespo4g/init.herring.rc:root/init.herring.rc

# GPS config
PRODUCT_COPY_FILES += \
    device/samsung/crespo4g/gps.conf:system/etc/gps.conf \
    device/samsung/crespo4g/gps.xml:system/vendor/etc/gps.xml

# APNs for 3G network access
PRODUCT_COPY_FILES += \
    device/samsung/crespo4g/4g-apns-conf.xml:system/etc/apns-conf.xml

# Overlay for WiMAX-related settings
DEVICE_PACKAGE_OVERLAYS := device/samsung/crespo4g/crespo4g_overlay \
    device/samsung/crespo4g/overlay

#Changes on this file should go above this line
$(call inherit-product-if-exists, vendor/samsung/crespo4g/device-vendor.mk)
$(call inherit-product, device/samsung/crespo/device_base.mk)
