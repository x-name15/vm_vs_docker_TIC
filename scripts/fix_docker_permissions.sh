#!/usr/bin/env bash
set -euo pipefail

echo "1) Actualizando repositorios e instalando jq..."
sudo apt-get update
sudo apt-get install -y jq

echo "2) Añadiendo usuario al grupo docker..."
USERNAME="$(whoami)"
sudo usermod -aG docker "${USERNAME}"

echo "3) Aplicando cambios de grupo en esta sesión..."
exec sg docker newgrp docker << 'EOI'
echo "   ✓ Ahora perteneces al grupo docker"
EOI

echo "4) Verificando instalaciones..."
echo -n "jq: "; jq --version
echo -n "Docker: "; docker version --format 'Client: {{.Client.Version}} - Server: {{.Server.Version}}'

cat << 'MSG'

✅ ¡Todo listo!

• Si esto muestra versiones correctas de Docker y jq, ya no tendrás “permission denied” ni falta de ‘jq’.
• Si usas Jupyter Notebook, reinicia el kernel o cierra y abre sesión.

MSG
