
#!/bin/bash
# Script para remover timestamps embutidos, linhas específicas e duplicatas em arquivos de legenda

input_file="$1"
output_file="$2"

if [ -z "$input_file" ] || [ -z "$output_file" ]; then
    echo "Uso: $0 <arquivo_entrada> <arquivo_saida>"
    exit 1
fi

# Remover linhas com '[Music]', intervalos de tempo, e remover timestamps internos
sed -E '/\[Music\]/d' "$input_file" | sed -E '/[0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3} --> [0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{3}/d' | sed -E 's/<[0-9]+:[0-9]+:[0-9]+\.[0-9]+><c>//g' | sed -E 's/<\/c>//g' | # Remover linhas duplicadas consecutivas
awk '!(seen[$0]++)' > "$output_file"

echo "Timestamps, linhas indesejadas e duplicatas removidos. Arquivo limpo salvo em: $output_file"
