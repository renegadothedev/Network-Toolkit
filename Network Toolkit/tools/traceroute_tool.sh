#!/bin/bash

traceroute_tool() {
    clear
    echo -e "${BLUE}=== Traceroute ===${NC}"
    echo
    read -p "Digite o endereço IP ou hostname para traçar a rota: " target
    
    if [ -z "$target" ]; then
        echo -e "${RED}[!] Nenhum alvo especificado${NC}"
        sleep 1
        main_menu
    fi
    
    echo -e "${YELLOW}[*] Executando traceroute para $target...${NC}"
    
    if $IS_TERMUX; then
        traceroute $target
    else
        traceroute -I $target  # Usa ICMP para traceroute no Linux
    fi
    
    read -p "Pressione Enter para continuar..."
    main_menu
}

traceroute_tool