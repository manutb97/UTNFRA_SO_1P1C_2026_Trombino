# Crear la estructura de directorios con sudo en /Estructura_Asignacion
sudo mkdir -p /Estructura_Asignacion/{correo/{cartas_{1..2},carteros_{1..2}},clientes/cartas_{1..2}}

# Validar la estructura (si existe tree lo usa, sino usa ls)
if command -v tree &> /dev/null; then
    tree /Estructura_Asignacion
else
    ls -R /Estructura_Asignacion
fi
