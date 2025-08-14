#!/bin/bash

speed_test() {
    clear
    echo -e "${BLUE}=== Teste de Velocidade ===${NC}"
    echo
    echo "1. Teste de velocidade simples (curl)"
    echo "2. Teste de velocidade completo (speedtest-cli)"
    echo "3. Voltar ao menu principal"
    echo
    read -p "Selecione uma opção [1-3]: " speed_option
    
    case $speed_option in
        1)
            echo -e "${YELLOW}[*] Teste de velocidade simples...${NC}"
            if $IS_TERMUX; then
                curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip
            else
                curl -o /dev/null http://speedtest.tele2.net/10MB.zip
            fi
            ;;
        2)
            if ! command -v speedtest-cli &> /dev/null; then
                echo -e "${RED}[!] speedtest-cli não instalado. Instalando...${NC}"
                if $IS_TERMUX; then
                    pip install speedtest-cli
                else
                    sudo apt-get install -y speedtest-cli
                fi
            fi
            echo -e "${YELLOW}[*] Executando teste de velocidade completo...${NC}"
            speedtest-cli
            ;;
        3)
            main_menu
            ;;
        *)
            echo -e "${RED}[!] Opção inválida!${NC}"
            sleep 1
            speed_test
            ;;
    esac
    
    read -p "Pressione Enter para continuar..."
    main_menu
}

speed_test