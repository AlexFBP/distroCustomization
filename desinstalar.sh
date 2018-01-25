#!/bin/bash

aplicacion=/usr/local/bin/glud.sh
sudoersfile=/etc/sudoers.d/glud

# rationale: Eliminacion de archivos
sudo rm -rf $aplicacion $sudoersfile

# rationale: Restaurado de .bashrc
archivos=(
~/.bashrc
"/root/.bashrc"
)

for i in "${archivos[@]}"; do
  if sudo grep -i "$aplicacion" $i &> /dev/null ; then
    sudo sed -i.bak "/source \/usr\/local\/bin\/glud.sh/d" $i
  else
    echo "El archivo $i ya estaba modificado correctamente."
  fi
done
