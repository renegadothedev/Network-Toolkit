
# Network Toolkit

## ⚠️ Disclaimer
**This tool is for educational and legitimate network administration purposes only.**  
The developer is **not responsible** for any misuse of this software. Unauthorized scanning of networks or systems without explicit permission may violate laws and regulations. Users are solely responsible for ensuring their activities comply with all applicable laws.

## 📡 About the Project

**Network Toolkit** is a collection of networking tools for diagnostics and analysis, working on both **Termux (Android)** and traditional **Linux terminals**. Ideal for network administrators, pentesters, and IT enthusiasts.

## ✨ Features

| Tool | Description | Termux | Linux |
|------|------------|--------|-------|
| **Ping** | Basic connectivity test | ✅ | ✅ |
| **Port Scanner** | Port scanning with nmap | ✅ | ✅ |
| **Speed Test** | Connection speed test | ✅ | ✅ |
| **Traceroute** | Route tracing | ✅ | ✅ |
| **WiFi Analyzer** | Wireless network analysis | ❌ | ✅ |
| **Network Info** | Detailed network information | ✅ | ✅ |

## 🚀 Installation

### Termux (Android)
```bash
pkg update && pkg upgrade
pkg install git nmap curl
git clone https://github.com/renegadothedev/Network-Toolkit.git
cd Network-Toolkit
chmod +x toolkit.sh
./toolkit.sh
```

### Linux
```bash
sudo apt update && sudo apt upgrade
sudo apt install git nmap curl traceroute iw
git clone https://github.com/renegadothedev/Network-Toolkit.git
cd Network-Toolkit
chmod +x toolkit.sh
./toolkit.sh
```

## 🖥️ Prerequisites
- Python 3.x (for speedtest-cli on Linux)
- Root permissions (for WiFi analysis on Linux)

## 🛠️ Project Structure
```
Network-Toolkit/
├── LICENSE
├── README.md
├── toolkit.sh          (Main script)
└── tools/
    ├── ping_tool.sh
    ├── port_scanner.sh
    ├── speed_test.sh
    ├── traceroute_tool.sh
    └── wifi_analyzer.sh
```

<div align="center">
  <img src="./image.png" alt="BB Network Toolkit" width="300">
</div>

## 📝 How to Contribute
1. Fork the project
2. Create your branch (`git checkout -b feature/new-tool`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-tool`)
5. Open a Pull Request

## 📜 License
Distributed under the MIT License. See `LICENSE` for more information.

## 📧 Contact
Renegade The Dev - [@renegadethedev](https://github.com/renegadothedev) - joaovitorbds752@gmail.com

---

**Tip**: For full functionality on Linux, install all recommended packages:  
`sudo apt install nmap curl traceroute speedtest-cli iw wireless-tools`  

[![Termux Demo](https://img.shields.io/badge/Demo-Termux-brightgreen)](https://example.com/demo) 
[![Linux Demo](https://img.shields.io/badge/Demo-Linux-blue)](https://example.com/demo)  

