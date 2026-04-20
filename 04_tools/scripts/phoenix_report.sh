#!/bin/bash
# Phoenix Report Generator

REPORT_FILE="06_reports/phoenix_report_$(date +%Y%m%d_%H%M%S).txt"

{
    echo "======================================"
    echo "   PROJECT PHOENIX - TEST REPORT"
    echo "======================================"
    echo "Date: $(date)"
    echo "Host: $(hostname)"
    echo ""
    
    echo "--- TARGET INFORMATION ---"
    echo "Device Model: $(adb shell getprop ro.product.model)"
    echo "Android Version: $(adb shell getprop ro.build.version.release)"
    echo "Security Patch: $(adb shell getprop ro.build.version.security_patch)"
    echo "Kernel Version: $(adb shell uname -r)"
    echo ""
    
    echo "--- EXPLOIT EXECUTION ---"
    echo "[*] Running kernel exploit..."
    adb shell /data/local/tmp/phoenix
    echo ""
    
    echo "--- PRIVILEGE STATUS ---"
    echo "Current UID: $(adb shell id)"
    echo ""
    
    echo "--- GENERATED FILES ---"
    ls -lh 02_payloads/android/
    echo ""
    
    echo "======================================"
    echo "         END OF REPORT"
    echo "======================================"
} | tee "$REPORT_FILE"

echo "[+] Report saved to: $REPORT_FILE"
