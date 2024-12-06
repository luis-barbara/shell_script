#!/bin/bash

# Verifica se o argumento foi passado como 'true', caso contrário, assume 'false'
nome_script_argumento=${1:-false}

# Verifica se esta dentro da pasta script_sample_folder
if [ "$(basename "$PWD")" != "script_sample_folder" ]; then
    echo "Erro: O script deve ser executado dentro da pasta script_sample_folder."
    exit 1
fi

# Verifica se o argumento é válido
if [[ "$nome_script_argumento" != "true" && "$nome_script_argumento" != "false" ]]; then
    echo "Erro: O argumento deve ser 'true' ou 'false'."
    exit 1
fi

# Percorre todos os diretórios no script_sample_folder
for pasta in script_sample_folder/*; do
    # Verifica se é um diretório
    if [ -d "$pasta" ]; then
        # Se argumento = true, apaga todos os diretórios
        if [ "$nome_script_argumento" == "true" ]; then
            echo "A apagar o diretório $pasta..."
            rm -rf "$pasta"
        else
            # Apaga apenas os diretorios que contem conteudo
            if [ "$(echo $pasta/*)" ]; then
                echo "A apagar o diretorio $pasta com conteudo..."
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
