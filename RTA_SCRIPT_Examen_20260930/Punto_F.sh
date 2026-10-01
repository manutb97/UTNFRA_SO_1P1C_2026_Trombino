# Definir el archivo de salida
ARCHIVO_OUT="Filtro_Avanzado.txt"

# Obtener IP Pública
IP_PUB=$(curl -s ifconfig.me)

# Obtener usuario actual
USUARIO=$(whoami)

# Obtener URL remota del repositorio Git
URL_REPO=$(git config --get remote.origin.url)

# Escribir la información filtrada en el archivo
cat <<EOF > $ARCHIVO_OUT
Mi IP Publica es: $IP_PUB
Mi usuario es: $USUARIO
El URL de mi repositorio es: $URL_REPO
EOF

cat $ARCHIVO_OUT

