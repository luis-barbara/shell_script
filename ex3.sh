#!/bin/bash

# Verifica se foi passado um caractere como argumento
if [ $# -ne 1 ]; then
    echo "Erro: Por favor, forneça um caractere como argumento."
    exit 1
fi

# Obtém o caractere fornecido como argumento
caractere="$1"

# Verifica se a pasta script_sample_folder existe no diretório atual
if [ ! -d "script_sample_folder" ]; then
    echo "Erro: A pasta 'script_sample_folder' não foi encontrada no diretório atual."
    exit 1
fi

# Percorre todos os diretórios dentro de script_sample_folder
for pasta in script_sample_folder/*; do
    # Verifica se é um diretório e se o nome contém o caractere fornecido
    # basename "$pasta" : extrai apenas o nome do diretório (sem o caminho completo)
    # == *"$caractere"* : verifica se o nome do diretório contém o caractere fornecido
    if [ -d "$pasta" ] && [[ "$(basename "$pasta")" == *"$caractere"* ]]; then
        # Remove todo o conteúdo do diretório, mas mantém o diretório vazio
        rm -r "$pasta"/* 

        # Mensagem de sucesso
        echo "Conteúdo da pasta $(basename "$pasta") foi apagado."
    fi
done

# Mensagem final
echo "Os diretorios com o caractere '$caractere' foram apagados com sucesso."
