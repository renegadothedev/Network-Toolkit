#!/bin/bash

# Network Toolkit v1.0
# Compatível com Termux e Linux

# Cores para o terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Verifica se está rodando no Termux
if [ -d "/data/data/com.termux/files/usr" ]; then
    IS_TERMUX=true
else
    IS_TERMUX=false
fi

# Função para verificar e instalar dependências
install_dependencies() {
    echo -e "${YELLOW}[*] Verificando dependências...${NC}"
    
    if $IS_TERMUX; then
        pkgs=("curl" "nmap" "iproute2" "coreutils" "procps")
        pkg_manager="pkg"
    else
        pkgs=("curl" "nmap" "iproute2" "traceroute" "speedtest-cli" "iw")
        pkg_manager="sudo apt-get"
    fi
    
    for pkg in "${pkgs[@]}"; do
        if ! command -v $pkg &> /dev/null; then
            echo -e "${RED}[!] $pkg não encontrado. Instalando...${NC}"
            $pkg_manager install -y $pkg || {
                echo -e "${RED}[!] Falha ao instalar $pkg${NC}"
                exit 1
            }
        fi
    done
    
    echo -e "${GREEN}[+] Todas as dependências estão instaladas.${NC}"
}

# Menu principal
main_menu() {
    clear
    echo -e "${BLUE}"
    echo "_______          __                       __     ___________           .__   __   .__  __   "
    echo "\      \   _____/  |___  _  _____________|  | __ \__    ___/___   ____ |  | |  | _|__|/  |_ "
    echo "/   |   \_/ __ \   __\ \/ \/ /  _ \_  __ \  |/ /   |    | /  _ \ /  _ \|  | |  |/ /  \   __\\"
    echo "/    |    \  ___/|  |  \     (  <_> )  | \/    <    |    |(  <_> |  <_> )  |_|    <|  ||  |  "
    echo "\____|__  /\___  >__|   \/\_/ \____/|__|  |__|_ \   |____| \____/ \____/|____/__|_ \__||__|  "
    echo "        \/     \/                              \/                                 \/"
    echo -e "${NC}"
    echo " Network Toolkit - https://github.com/renegadothedev"
    echo "================================================"
    echo
    echo "1. Teste de Ping"
    echo "2. Scanner de Portas"
    echo "3. Teste de Velocidade"
    echo "4. Traceroute"
    echo "5. Analisador WiFi (Linux apenas)"
    echo "6. Verificar Conexão da Internet"
    echo "7. Informações de Rede"
    echo "8. Sair"
    echo
    read -p "Selecione uma opção [1-8]: " choice
    
    case $choice in
        1) source tools/ping_tool.sh ;;
        2) source tools/port_scanner.sh ;;
        3) source tools/speed_test.sh ;;
        4) source tools/traceroute_tool.sh ;;
        5) if $IS_TERMUX; then
               echo -e "${RED}[!] Esta opção não está disponível no Termux${NC}"
               sleep 2
               main_menu
           else
               source tools/wifi_analyzer.sh
           fi ;;
        6) check_internet ;;
        7) network_info ;;
        8) echo -e "${GREEN}[+] Saindo...${NC}"; exit 0 ;;
        *) echo -e "${RED}[!] Opção inválida!${NC}"; sleep 1; main_menu ;;
    esac
}

# Função para verificar conexão com a internet
check_internet() {
    echo -e "${YELLOW}[*] Verificando conexão com a internet...${NC}"
    
    if ping -c 3 8.8.8.8 &> /dev/null; then
        echo -e "${GREEN}[+] Conexão com a internet: OK${NC}"
    else
        echo -e "${RED}[!] Sem conexão com a internet${NC}"
    fi
    
    read -p "Pressione Enter para continuar..."
    main_menu
}

# Função para mostrar informações de rede
network_info() {
    echo -e "${YELLOW}[*] Obtendo informações de rede...${NC}"
    echo
    
    echo -e "${BLUE}=== Interface de Rede ===${NC}"
    if $IS_TERMUX; then
        ip addr show | grep -w "inet" | awk '{print "IP: "$2" | Interface: "$NF}'
    else
        ip -brief address
    fi
    
    echo
    echo -e "${BLUE}=== Gateway Padrão ===${NC}"
    ip route | grep default
    
    echo
    echo -e "${BLUE}=== DNS ===${NC}"
    if $IS_TERMUX; then
        getprop net.dns1 2>/dev/null || echo "Não foi possível obter DNS no Termux"
    else
        cat /etc/resolv.conf | grep nameserver
    fi
    
    echo
    echo -e "${BLUE}=== Informações de Roteamento ===${NC}"
    ip route
    
    read -p "Pressione Enter para continuar..."
    main_menu
}

# Inicialização
install_dependencies
main_menu