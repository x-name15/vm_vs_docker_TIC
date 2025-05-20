#!/bin/bash
# setup_project.sh: Instala dependencias y crea estructura de proyecto VM vs Docker

set -e

# 1. Actualizar sistema e instalar dependencias
echo "Actualizar y preparar sistema..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench docker.io virtualbox git curl procps unzip

# 2. Instalar paquetes Python
echo "Instalar paquetes Python..."
pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil pandas

# 3. Configurar permisos Docker
if ! groups $USER | grep -q docker; then
    echo "Añadiendo usuario al grupo docker..."
    sudo usermod -aG docker $USER
    echo "Reinicia la sesión o la máquina para aplicar permisos de Docker."
fi

# 4. Crear estructura de proyecto
echo "Crear estructura de carpetas..."
BASE_DIR="vm_vs_docker_benchmark"
mkdir -p "$BASE_DIR"/{notebooks,scripts,results}

# 5. Crear scripts de setup
echo "Crear scripts de setup..."
cat > "$BASE_DIR/scripts/vm_setup.sh" << 'EOF'
#!/bin/bash
# vm_setup.sh: Preparar entorno en VM
set -e
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench docker.io git curl procps
pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil
sudo usermod -aG docker $USER
echo "VM configurada. Reinicia para aplicar permisos de Docker."
EOF
chmod +x "$BASE_DIR/scripts/vm_setup.sh"

cat > "$BASE_DIR/scripts/docker_setup.sh" << 'EOF'
#!/bin/bash
# docker_setup.sh: Preparar entorno en Docker o WSL2
set -e
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip sysbench git curl procps
pip3 install --upgrade pip
pip3 install jupyter matplotlib psutil
echo "Entorno Docker/WSL2 configurado."
EOF
chmod +x "$BASE_DIR/scripts/docker_setup.sh"

cat > "$BASE_DIR/scripts/fix_docker_permissions.sh" << 'EOF'
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
EOF
chmod +x "$BASE_DIR/scripts/fix_docker_permissions.sh"

# 6. Crear Dockerfile
echo "Crear Dockerfile..."
cat > "$BASE_DIR/scripts/Dockerfile" << 'EOF'
FROM ubuntu:20.04
RUN apt update && apt install -y sysbench git curl procps \
    && pip install --upgrade pip \
    && pip install curl \
    && pip install jupyter matplotlib psutil pandas
WORKDIR /app
COPY . .
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]
EOF

# 7. Crear README y .gitignore
echo "Crear README y .gitignore..."
cat > "$BASE_DIR/README.md" << 'EOF'
# VM vs Docker Performance Benchmark Project

Este proyecto compara el uso de recursos y métricas de rendimiento entre una máquina virtual (VirtualBox) y un contenedor Docker.

## Estructura del proyecto
- notebooks/: Notebook para ejecutar y graficar benchmarks
- scripts/: Scripts de setup para VM y Docker, y Dockerfile
- results/: Resultados (CSV, gráficos)

## Requisitos
- Ubuntu o Debian compatible
- Python 3.8+
- Docker (host o WSL2)
- VirtualBox
- sysbench, jupyter, matplotlib, psutil, pandas

## Uso rápido
Ejecuta:
\`\`\`bash
bash setup_project.sh
\`\`\`
Luego:
\`\`\`
cd vm_vs_docker_benchmark/scripts
bash vm_setup.sh      # en VM
bash docker_setup.sh  # en Docker o WSL2
\`\`\`
EOF

cat > "$BASE_DIR/.gitignore" << 'EOF'
__pycache__/
*.pyc
*.ipynb_checkpoints/
results/
EOF

echo "¡Instalación y estructura de proyecto completadas!"
