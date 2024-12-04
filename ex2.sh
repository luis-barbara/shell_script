#!/bin/bash

# Verifica se foi passado um prefixo como argumento
if [ $# -ne 1 ]; then
    # Mensagem de erro se o prefixo não for fornecido
    echo "Erro: Por favor, forneça um prefixo como argumento."
    exit 1
fi

# Obtém o prefixo fornecido
prefixo="$1"

# Verifica se a pasta script_sample_folder existe no diretório atual
if [ ! -d "script_sample_folder" ]; then
    echo "Erro: A pasta 'script_sample_folder' não foi encontrada no diretório atual."
    exit 1
fi

# Percorre todas as pastas dentro de script_sample_folder
for pasta in script_sample_folder/*; do
    # Verifica se é um diretório
    if [ -d "$pasta" ]; then
        # Obtém o nome da pasta sem o caminho
        nome_da_pasta=$(basename "$pasta")
        
        # Define o novo nome da pasta com o prefixo
        novo_nome="script_sample_folder/${prefixo}-${nome_da_pasta}"
        
        # Renomear a pasta (dentro de script_sample_folder)
        mv "$pasta" "$novo_nome"
        
        # Mensagem de sucesso
        echo "Pasta renomeada de $nome_da_pasta para ${prefixo}-${nome_da_pasta}"
    fi
done

# Mensagem de sucesso final
echo "Todas as pastas em 'script_sample_folder' foram renomeadas com o prefixo '$prefixo'."
