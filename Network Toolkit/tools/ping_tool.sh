#!/bin/bash

ping_tool() {
    clear
    echo -e "${BLUE}=== Teste de Ping ===${NC}"
    echo
    read -p "Digite o endereço IP ou hostname para pingar: " target
    
    if [ -z "$target" ]; then
        echo -e "${RED}[!] Nenhum alvo especificado${NC}"
        sleep 1
        main_menu
    fi
    
    echo -e "${YELLOW}[*] Iniciando ping para $target... (Ctrl+C para parar)${NC}"
    ping -c 4 $target
    
    read -p "Pressione Enter para continuar..."
    main_menu
}

ping_tool