# 🔥 Project Phoenix - Android Exploit Chain

![Version](https://img.shields.io/badge/version-2.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Android-red)
![Language](https://img.shields.io/badge/language-C%20%7C%20Java%20%7C%20JavaScript-yellow)

> **⚠️ EDUCATIONAL PURPOSE ONLY**  
> This project is designed for security research and educational purposes. Use only on devices you own or have explicit permission to test.

## 📋 Overview

Project Phoenix is a complete Android exploitation framework demonstrating a full attack chain:


[Initial Access] → [Sandbox Escape] → [Privilege Escalation] → [Persistence]
APK Chrome UAF Kernel UAF Camera RAT

text

### 🎯 Attack Chain Components

| Stage | Technique | CVE | Status |
|-------|-----------|-----|--------|
| 1️⃣ Initial Access | Malicious APK (Meterpreter) | N/A | ✅ Working |
| 2️⃣ Sandbox Escape | Chrome Portals UAF | CVE-2021-37973 | ⚠️ Patched |
| 3️⃣ Privilege Escalation | Kernel eventpoll UAF | CVE-2021-1048 | ⚠️ Patched |
| 4️⃣ Persistence | Camera RAT Service | N/A | ✅ Working |

## 🏗️ Architecture
Project_Phoenix/
├── 📁 01_recon/ # Reconnaissance data
├── 📁 02_payloads/ # Generated payloads
│ ├── android/ # Android payloads
│ ├── linux/ # Linux payloads
│ └── windows/ # Windows payloads
├── 📁 03_exploits/ # Exploit source codes
│ ├── kernel/ # Kernel exploits
│ ├── browser/ # Browser exploits
│ └── local/ # Local exploits
├── 📁 04_tools/ # Scripts and tools
│ ├── ndk/ # Android NDK (ignored)
│ ├── metasploit/ # MSF scripts
│ └── scripts/ # Helper scripts
├── 📁 05_logs/ # Execution logs
├── 📁 06_reports/ # Generated reports
├── 🔧 phoenix_dashboard.sh # Main control panel
├── 📄 README.md
├── 📄 LICENSE
└── 📄 .gitignore

text

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/Project_Phoenix.git
cd Project_Phoenix

# Make scripts executable
chmod +x phoenix_dashboard.sh
chmod +x 04_tools/scripts/*.sh

# Run the dashboard
./phoenix_dashboard.sh
📚 Documentation
Full documentation available in PHOENIX_MANUAL.md

Prerequisites
bash
# Install required tools
sudo apt update
sudo apt install -y adb fastboot metasploit-framework gcc
Basic Usage
bash
# 1. Compile exploits
./04_tools/scripts/phoenix_compile.sh

# 2. Deploy to device
./04_tools/scripts/phoenix_deploy.sh

# 3. Run kernel exploit
adb shell /data/local/tmp/phoenix

# 4. Generate report
./04_tools/scripts/phoenix_report.sh
🛠️ Features
✅ Modular Design - Easy to add new exploits

✅ Automated Compilation - Cross-compile for ARM64/x86-64

✅ One-Click Deployment - Push payloads via ADB

✅ Interactive Dashboard - User-friendly control panel

✅ Comprehensive Logging - Track all activities

✅ Report Generation - Professional documentation

📊 Tested Environments
Device	Android	Kernel	Result
Infinix X669C	12	4.19.191	❌ Patched
Docker Ubuntu 18.04	-	4.15.0	✅ Vulnerable
Genymotion VM	10	4.14.0	✅ Vulnerable
🔍 Included Exploits
CVE-2021-1048 - Kernel UAF
File: 03_exploits/kernel/phoenix_kernel.c

Type: Local Privilege Escalation

Affected: Linux Kernel 4.14 - 5.10

CVE-2021-37973 - Chrome Sandbox Escape
File: 03_exploits/browser/phoenix_sandbox.js

Type: Browser Sandbox Escape

Affected: Chrome < 94.0.4606.61

Phoenix RAT - Camera Access
File: 02_payloads/android/PhoenixRAT.java

Type: Post-Exploitation Payload

Requires: Root Access

🤝 Contributing
Contributions are welcome! Please follow these steps:

Fork the repository

Create a feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

⚠️ Disclaimer
THIS SOFTWARE IS PROVIDED FOR EDUCATIONAL USE ONLY!

The author is not responsible for any misuse of this software. Use it only on devices you own or have explicit written permission to test. Unauthorized access to computer systems is illegal and punishable by law.

🔗 References
CVE-2021-1048 Detail

CVE-2021-37973 Detail

Android Security Bulletin

Metasploit Documentation

📞 Contact
For educational inquiries only:

Create an issue in this repository

Check the documentation first

Made with 🔥 by Security Researchers | Version 2.0 | April 2026
EOF

۴. ایجاد CONTRIBUTING.md
cat > CONTRIBUTING.md << 'EOF'

Contributing to Project Phoenix
Thank you for your interest in contributing to Project Phoenix!

🎯 How to Contribute
Reporting Bugs
Check if the bug is already reported in Issues

Use the bug report template

Include detailed steps to reproduce

Mention your environment (OS, Android version, etc.)

Suggesting Enhancements
Describe the enhancement in detail

Explain why it would be useful

Provide example use cases

Pull Requests
Fork the repository

Create a feature branch

Write clear commit messages

Test your changes thoroughly

Update documentation if needed

Submit a pull request

📋 Code Style
C: Follow Linux kernel coding style

Java: Follow Android coding conventions

JavaScript: Use ES6+ syntax

Bash: Use shellcheck validation

⚠️ Important Notes
All exploits must be for EDUCATIONAL PURPOSES ONLY

Include proper documentation for each exploit

Test on isolated environments only

Do not submit malware or actual payloads

🔒 Security
If you discover a security vulnerability, please:

DO NOT create a public issue

Email the maintainer privately

Allow time for responsible disclosure

✅ Code of Conduct
Be respectful and professional

Focus on educational value

No malicious intent

Help others learn

Thank you for contributing responsibly!
EOF

echo "✅ فایل‌های GitHub آماده شدند!"


