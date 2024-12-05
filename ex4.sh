#!/bin/bash

# Verifica se o argumento boleano foi passado
if [ $# -gt 1 ]; then
    # Mensagem de erro se o número de argumentos for maior que 1
    echo "Erro: O script aceita apenas um argumento."
    exit 1
fi

# Se o argumento for "true", apagar todos os diretórios
if [ "$1" == "true" ]; then
    echo "A apagar todos os diretórios dentro de script_sample_folder..."
    for dir in script_sample_folder/*; do
        if [ -d "$dir" ]; then
            # Apaga o diretório, incluindo todo o seu conteúdo
            rm -rf "$dir"
            echo "Diretório $dir apagado com sucesso."
        fi
    done

# Se o argumento for "false" ou não for passado, apagar apenas diretórios com conteúdo
else
    echo "A apagar diretórios com conteúdo dentro de script_sample_folder..."
    for dir in script_sample_folder/*; do
        if [ -d "$dir" ]; then
            # Verifica se o diretório tem conteúdo
            if [ "$(ls -A "$dir")" ]; then
                # Apaga o diretório com conteúdo
                rm -rf "$dir"
                echo "Diretório $dir com conteúdo apagado."
            else
                echo "Diretório $dir está vazio, não será apagado."
            fi
        fi
    done
fi

# Mensagem final
echo "Del de diretórios concluída."