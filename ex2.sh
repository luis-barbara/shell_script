#!/bin/bash

# Verifica se foi passado um prefixo como argumento
if [ $# -ne 1 ]; then
    # Mensagem de erro se o prefixo não for fornecido
    echo "Erro: Por favor, forneça um prefixo como argumento."
    exit 1
fi

# Obtém o prefixo fornecido
prefixo="$1"

# Verifica se está rodando dentro da pasta samples
if [ "$(basename "$PWD")" != "samples" ]; then
    # Mensagem de erro se não estiver na pasta correta
    echo "Erro: Este script deve ser executado dentro da pasta samples."
    exit 1
fi

# Percorre todas as pastas dentro da script_sample_folder
for pasta in ./script_sample_folder/*; do
    # Verifica se é um diretório
    if [ -d "$pasta" ]; then
        # Obtém o nome da pasta sem a barra final
        nome_da_pasta=$(basename "$pasta")
        
        # Define o novo nome da pasta com o prefixo
        novo_nome="${prefixo}-${nome_da_pasta}"
        
        # Renomear a pasta
        mv "$pasta" "$novo_nome"
        
        # Mensagem de sucesso 
        echo "Pasta renomeada de $nome_da_pasta para $novo_nome"
    fi
done

# Mensagem de sucesso 
echo "Todas as pastas foram renomeadas com o prefixo '$prefixo'."