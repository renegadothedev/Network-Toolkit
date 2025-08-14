#!/bin/bash

port_scanner() {
    clear
    echo -e "${BLUE}=== Scanner de Portas ===${NC}"
    echo
    echo "1. Varredura rápida (portas comuns)"
    echo "2. Varredura completa (todas as portas)"
    echo "3. Varredura personalizada"
    echo "4. Voltar ao menu principal"
    echo
    read -p "Selecione uma opção [1-4]: " scan_type
    
    case $scan_type in
        1)
            read -p "Digite o endereço IP ou hostname para scanear: " target
            echo -e "${YELLOW}[*] Varredura rápida em $target...${NC}"
            nmap -F $target
            ;;
        2)
            read -p "Digite o endereço IP ou hostname para scanear: " target
            echo -e "${YELLOW}[*] Varredura completa em $target (pode demorar)...${NC}"
            nmap -p- $target
            ;;
        3)
            read -p "Digite o endereço IP ou hostname para scanear: " target
            read -p "Digite as portas para scanear (ex: 80,443,1000-2000): " ports
            echo -e "${YELLOW}[*] Varredura personalizada em $target nas portas $ports...${NC}"
            nmap -p $ports $target
            ;;
        4)
            main_menu
            ;;
        *)
            echo -e "${RED}[!] Opção inválida!${NC}"
            sleep 1
            port_scanner
            ;;
    esac
    
    read -p "Pressione Enter para continuar..."
    main_menu
}

port_scanner