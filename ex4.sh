#!/bin/bash

# Verifica se o argumento foi passado como 'true', caso contrário, assume 'false'
apagar_tudo=${1:-false}

# Verifica se esta dentro da pasta script_sample_folder
if [ "$(basename "$PWD")" != "script_sample_folder" ]; then
    echo "Erro: O script deve ser executado dentro da pasta script_sample_folder."
    exit 1
fi

# Percorre todos os diretórios no script_sample_folder
for pasta in */; do
    # Verifica se é um diretório
    if [ -d "$pasta" ]; then
        # Se apagar_tudo for true, apaga todos os diretórios
        if [ "$apagar_tudo" == "true" ]; then
            echo "A apagar o diretório $pasta..."
            rm -rf "$pasta"
        else
            # Se o diretório não estiver vazio, apaga o conteúdo
            if [ "$(ls "$pasta")" ]; then
                echo "A apagar o conteúdo do diretório $pasta..."
                rm -rf "$pasta"
            fi
        fi
    fi
done

echo "Del concluída."



# 1) Para apagar apenas diretórios com conteúdo:
# Sem argumento: ./script.sh
# Ou com o argumento "false": ./script.sh false

# 2) Para apagar todos os diretórios, independentemente de estarem vazios ou não:
# Com o argumento "true": ./script.sh true
