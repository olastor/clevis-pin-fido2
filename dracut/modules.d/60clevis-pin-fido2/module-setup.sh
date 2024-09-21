#!/bin/bash
# Copyright (c) 2024 Benjamino Masyura <benjama@keemail.me>

check() {
    require_binaries clevis-decrypt-fido2 fido2-token fido2-assert jose head tail cut wc printf base64 dd || return 1
    return 0
}

depends() {
    echo clevis udev-rules
    return 0
}

install() {
    inst_multiple clevis-decrypt-fido2 fido2-token fido2-assert jose head tail cut wc printf base64 dd
    inst_libdir_file \
        {"tls/$_arch/",tls/,"$_arch/",}"libfido2.so.*" \
        {"tls/$_arch/",tls/,"$_arch/",}"libz.so.*" \
        {"tls/$_arch/",tls/,"$_arch/",}"libcbor.so.*" \
        {"tls/$_arch/",tls/,"$_arch/",}"libhidapi-hidraw.so.*"
}

installkernel() {
    hostonly='' instmods =drivers/hid/usbhid
}


