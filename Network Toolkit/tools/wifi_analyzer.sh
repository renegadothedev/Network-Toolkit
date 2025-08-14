#!/bin/bash

wifi_analyzer() {
    clear
    echo -e "${BLUE}=== Analisador WiFi ===${NC}"
    echo
    
    if [ "$(id -u)" -ne 0 ]; then
        echo -e "${RED}[!] Esta ferramenta requer privilégios de root${NC}"
        read -p "Pressione Enter para continuar..."
        main_menu
    fi
    
    interface=$(iw dev | awk '$1=="Interface"{print $2}')
    
    if [ -z "$interface" ]; then
        echo -e "${RED}[!] Nenhuma interface WiFi encontrada${NC}"
        read -p "Pressione Enter para continuar..."
        main_menu
    fi
    
    echo -e "${YELLOW}[*] Interface WiFi detectada: $interface${NC}"
    echo
    echo "1. Ver redes WiFi disponíveis"
    echo "2. Ver informações detalhadas da conexão atual"
    echo "3. Voltar ao menu principal"
    echo
    read -p "Selecione uma opção [1-3]: " wifi_option
    
    case $wifi_option in
        1)
            echo -e "${YELLOW}[*] Procurando redes WiFi... (Ctrl+C para parar)${NC}"
            sudo iwlist $interface scan | grep -E "ESSID|Quality|Encryption"
            ;;
        2)
            echo -e "${YELLOW}[*] Informações da conexão atual:${NC}"
            iwconfig $interface
            echo
            echo -e "${YELLOW}[*] Endereço IP:${NC}"
            ip addr show $interface | grep -w "inet"
            ;;
        3)
            main_menu
            ;;
        *)
            echo -e "${RED}[!] Opção inválida!${NC}"
            sleep 1
            wifi_analyzer
            ;;
    esac
    
    read -p "Pressione Enter para continuar..."
    main_menu
}

wifi_analyzer