#!/bin/bash

DISCO="/dev/sdb"

# Particionar disco /dev/sdb con fdisk
# Particiones primarias 1 a 3 (+1G cada una)
# Partición extendida 4 con el resto del espacio
# Particiones lógicas 5 a 11 (+1G cada una)
sudo fdisk $DISCO <<EOF
o
n
p
1

+1G
n
p
2

+1G
n
p
3

+1G
n
e
4


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF

# Formatear particiones a ext4
sudo mkfs.ext4 -F /dev/sdb1
sudo mkfs.ext4 -F /dev/sdb2
sudo mkfs.ext4 -F /dev/sdb3
sudo mkfs.ext4 -F /dev/sdb5
sudo mkfs.ext4 -F /dev/sdb6
sudo mkfs.ext4 -F /dev/sdb7
sudo mkfs.ext4 -F /dev/sdb8
sudo mkfs.ext4 -F /dev/sdb9
sudo mkfs.ext4 -F /dev/sdb10
sudo mkfs.ext4 -F /dev/sdb11

# Montar particiones en fstab
cat <<EOF | sudo tee -a /etc/fstab
/dev/sdb1 /Examenes-UTN/Alumno_1/Parcial_1 ext4 defaults 0 0
/dev/sdb2 /Examenes-UTN/Alumno_1/Parcial_2 ext4 defaults 0 0
/dev/sdb3 /Examenes-UTN/Alumno_1/Parcial_3 ext4 defaults 0 0
/dev/sdb5 /Examenes-UTN/Alumno_2/Parcial_1 ext4 defaults 0 0
/dev/sdb6 /Examenes-UTN/Alumno_2/Parcial_2 ext4 defaults 0 0
/dev/sdb7 /Examenes-UTN/Alumno_2/Parcial_3 ext4 defaults 0 0
/dev/sdb8 /Examenes-UTN/Alumno_3/Parcial_1 ext4 defaults 0 0
/dev/sdb9 /Examenes-UTN/Alumno_3/Parcial_2 ext4 defaults 0 0
/dev/sdb10 /Examenes-UTN/Alumno_3/Parcial_3 ext4 defaults 0 0
/dev/sdb11 /Examenes-UTN/Profesores ext4 defaults 0 0
EOF

# Aplicar los montajes
sudo mount -a

