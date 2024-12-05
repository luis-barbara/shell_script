#!/bin/bash

# Verifica se o número de argumentos é correto
if [ $# -gt 1 ]; then
    # Mensagem de erro se o número de argumentos for maior que 1
    echo "Erro: O script aceita apenas um argumento."
    exit 1
fi

# Se o argumento não foi passado ou é "false", apagar apenas diretórios com conteúdo
if [ -z "$1" ] || [ "$1" == "false" ]; then
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

# Se o argumento for "true", apagar todos os diretórios
elif [ "$1" == "true" ]; then
    echo "A apagar todos os diretórios dentro de script_sample_folder..."
    for dir in script_sample_folder/*; do
        if [ -d "$dir" ]; then
            # Apaga o diretório, incluindo todo o seu conteúdo
            rm -rf "$dir"
            echo "Diretório $dir apagado com sucesso."
        fi
    done

else
    # Se o argumento for inválido
    echo "Erro: O argumento deve ser 'true' ou 'false'."
    exit 1
fi

# Mensagem final
echo "Del de diretórios concluída."



# 1) Para apagar apenas diretórios com conteúdo:
# Sem argumento (o comportamento padrão): ./script.sh
# Ou com o argumento "false": ./script.sh false

# 2) Para apagar todos os diretórios, independentemente de estarem vazios ou não:
# Com o argumento "true": ./script.sh true