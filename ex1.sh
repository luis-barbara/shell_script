#!/bin/bash

# Verifica se está rodando dentro da pasta samples
if [ "$(basename "$PWD")" != "samples" ]; then
    # Mensagem de erro
    echo "Erro: Este script deve ser executado dentro da pasta samples."
    # Encerra o script
    exit 1
fi

# Percorre todas as pastas dentro da script_sample_folder
for pasta in ./script_sample_folder/*; do
    # Verifica se é uma pasta
    if [ -d "$pasta" ]; then
        # Obtém o nome da pasta (sem a barra no final)
        nome_da_pasta=$(basename "$pasta")
        
        # Define o nome do arquivo de texto
        arquivo_txt="script_sample_folder-${nome_da_pasta}.txt"
        
        # Cria o arquivo .txt dentro da pasta correspondente
        echo "script_sample_folder-${nome_da_pasta}" > "$pasta/$arquivo_txt"
        
        # Mensagem de sucesso 
        echo "Arquivo $arquivo_txt criado na pasta $pasta"
    fi
done

# Mensagem de sucesso 
echo "Todos os arquivos .txt foram criados com sucesso."

    


