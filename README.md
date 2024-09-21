# clevis-pin-fido2

⚠️ **Use at own risk and consider this plugin to be experimental right now.** ⚠️

## Requirements

- [libfido2](https://developers.yubico.com/libfido2/)
- [clevis](https://github.com/latchset/clevis)
- A compatible fido2 token (e.g. Yubikey, Nitrokey) that supports the **hmac-secret** extension

You can check whether or not your token is suitable by executing `fido2-token -I /dev/hidraw0 | grep hmac-secret` (use `fido2-token -L` to get the correct `/dev/hidrawX` path). For valid authenticators it will match a line like "extension strings: credProtect, hmac-secret".

## Installation

Copy `clevis-encrypt-fido2` and `clevis-encrypt-fido2` to the `$PATH` directory in which clevis is installed (or any local bin path if it should only work for the current user).

## Dracut

Copy the contents of `dracut/` to one of the dracut configuration directories: `/usr/lib/dracut/` or `/etc/dracut/`. This module depends on the Clevis module. Due to dracut limitations, `clevis-{decrypt,encrypt}-fido2` scripts must reside in directories that dracut scans for executables (ignores `$PATH`): `/bin:/sbin:/usr/bin:/usr/sbin`.