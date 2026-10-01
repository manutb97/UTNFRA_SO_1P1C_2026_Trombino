# Obtener hash de contraseña del usuario liveuser o root
HASH_CLAVE=$(sudo grep liveuser /etc/shadow | cut -d: -f2)

# Crear grupos
sudo groupadd -f p1c2_2024_gAlumno
sudo groupadd -f p1c2_2024_gProfesores

# Crear usuarios con su respectivo grupo y clave
sudo useradd -m -s /bin/bash -g p1c2_2024_gAlumno -p "$HASH_CLAVE" p1c2_2024_A1
sudo useradd -m -s /bin/bash -g p1c2_2024_gAlumno -p "$HASH_CLAVE" p1c2_2024_A2
sudo useradd -m -s /bin/bash -g p1c2_2024_gAlumno -p "$HASH_CLAVE" p1c2_2024_A3
sudo useradd -m -s /bin/bash -g p1c2_2024_gProfesores -p "$HASH_CLAVE" p1c2_2024_P1

# Ajustar dueños y permisos en las carpetas
sudo chown -R p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/Alumno_1
sudo chown -R p1c2_2024_A2:p1c2_2024_gAlumno /Examenes-UTN/Alumno_2
sudo chown -R p1c2_2024_A3:p1c2_2024_gAlumno /Examenes-UTN/Alumno_3
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/Profesores

# Permisos: 750 (lectura/escritura/ejecución para dueño, lectura/ejecución para grupo, nada para otros)
sudo chmod -R 750 /Examenes-UTN/Alumno_1
sudo chmod -R 750 /Examenes-UTN/Alumno_2
sudo chmod -R 750 /Examenes-UTN/Alumno_3
sudo chmod -R 770 /Examenes-UTN/Profesores
