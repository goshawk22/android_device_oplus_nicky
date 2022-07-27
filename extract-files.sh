#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=nicky
VENDOR=oplus

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to not sanitizing the vendor folder before extraction
CLEAN_VENDOR=false

# Proprietary files list
DEVICE_NAME="Common"

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -c | --cleanup )
                CLEAN_VENDOR=true
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        -d | --device )
                DEVICE_NAME="${2}"; shift
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

if [ "${DEVICE_NAME}" = "Common" ]; then
    extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
elif [ "${DEVICE_NAME}" = "3 Pro" ]; then
    extract "${MY_DIR}/proprietary-files-3-Pro.txt" "${SRC}" "${KANG}" --section "${SECTION}"
elif [ "${DEVICE_NAME}" = "X" ]; then
    extract "${MY_DIR}/proprietary-files-X.txt" "${SRC}" "${KANG}" --section "${SECTION}"
elif [ "${DEVICE_NAME}" = "XT" ]; then
    extract "${MY_DIR}/proprietary-files-XT.txt" "${SRC}" "${KANG}" --section "${SECTION}"
fi

"${MY_DIR}/setup-makefiles.sh"
