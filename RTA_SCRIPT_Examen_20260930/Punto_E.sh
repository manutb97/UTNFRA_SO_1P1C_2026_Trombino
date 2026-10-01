# Obtener memoria Total desde /proc/meminfo y la información del fabricante desde dmidecode
ARCHIVO_OUT="Filtro_Basico.txt"

# Memoria RAM Total
grep MemTotal /proc/meminfo > $ARCHIVO_OUT

# Chasis / Fabricante (si dmidecode está disponible)
if command -v dmidecode &> /dev/null; then
    sudo dmidecode -t chassis | grep -i "Manufacturer" >> $ARCHIVO_OUT
fi

