#!/bin/bash

# Emoji do Twitter
echo "🐦 Tutorial Python Twitter 🐦"

# Função para parar e remover todos os contêineres
stop_and_remove_containers() {
    echo "Parando e removendo todos os contêineres..."
    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

# Função para iniciar todos os contêineres
start_all() {
    # Pergunta ao usuário se deseja parar todos os contêineres antes de iniciar os novos serviços
    read -p "Deseja parar todos os contêineres antes de iniciar os novos serviços? (y/n): " resposta
    if [ "$resposta" = "y" ]; then
        stop_and_remove_containers
    fi

    # Executa o docker-compose.yml
    echo "Iniciando o banco de dados e aplicação..."
    docker-compose up -d 2>/dev/null

    # Executa o docker-observability.yml
    echo "Iniciando o serviço de observabilidade..."
    docker-compose -f docker-observability.yml up -d 2>/dev/null

    # Executa o docker-kafka.yml
    echo "Iniciando o serviço Kafka..."
    docker-compose -f docker-kafka.yml up -d 2>/dev/null

    # Exibe os detalhes dos contêineres em execução
    echo "Contêineres em execução:"
    docker ps --format "Nome: {{.Names}} | Host: {{.Ports}}"
}

# Função para iniciar apenas a aplicação (docker-compose.yml)
start_app() {
    # Pergunta ao usuário se deseja parar todos os contêineres antes de iniciar os novos serviços
    read -p "Deseja parar todos os contêineres antes de iniciar os novos serviços? (y/n): " resposta
    if [ "$resposta" = "y" ]; then
        stop_and_remove_containers
    fi

    # Executa o docker-compose.yml
    echo "Iniciando a aplicação..."
    docker-compose up -d 2>/dev/null

    # Exibe os detalhes dos contêineres em execução
    echo "Contêineres em execução:"
    docker ps --format "Nome: {{.Names}} | Host: {{.Ports}}"
}

# Função para iniciar apenas o serviço de observabilidade (docker-observability.yml)
start_observability() {
    # Pergunta ao usuário se deseja parar todos os contêineres antes de iniciar os novos serviços
    read -p "Deseja parar todos os contêineres antes de iniciar os novos serviços? (y/n): " resposta
    if [ "$resposta" = "y" ]; then
        stop_and_remove_containers
    fi

    # Executa o docker-observability.yml
    echo "Iniciando o serviço de observabilidade..."
    docker-compose -f docker-observability.yml up -d 2>/dev/null

    # Exibe os detalhes dos contêineres em execução
    echo "Contêineres em execução:"
    docker ps --format "Nome: {{.Names}} | Host: {{.Ports}}"
}

# Função para iniciar apenas o Kafka (docker-kafka.yml)
start_kafka() {
    # Pergunta ao usuário se deseja parar todos os contêineres antes de iniciar os novos serviços
    read -p "Deseja parar todos os contêineres antes de iniciar os novos serviços? (y/n): " resposta
    if [ "$resposta" = "y" ]; then
        stop_and_remove_containers
    fi

    # Executa o docker-kafka.yml
    echo "Iniciando o serviço Kafka..."
    docker-compose -f docker-kafka.yml up -d 2>/dev/null

    # Exibe os detalhes dos contêineres em execução
    echo "Contêineres em execução:"
    docker ps --format "Nome: {{.Names}} | Host: {{.Ports}}"
}

# Função para parar todos os contêineres
stop_all() {
    stop_and_remove_containers
}

# Pergunta ao usuário qual serviço deseja iniciar
echo "Selecione uma opção:"
echo "1 - Executar todos os containers"
echo "2 - Executar apenas aplicação (docker-compose.yml)"
echo "3 - Executar apenas observabilidade (docker-observability.yml)"
echo "4 - Executar apenas o Kafka (docker-kafka.yml)"
echo "5 - Parar todos os containers"
read -p "Opção: " opcao

# Verifica a opção selecionada pelo usuário
case $opcao in
    1)
        start_all
        ;;
    2)
        start_app
        ;;
    3)
        start_observability
        ;;
    4)
        start_kafka
        ;;
    5)
        stop_all
        ;;
    *)
        echo "Opção inválida. Saindo..."
        exit 1
        ;;
esac
