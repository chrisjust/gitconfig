#!/bin/sh
echo "Vil du installere Hub?"
read INSTALL_HUB
if { [ "$INSTALL_HUB" != "y" ]; }; then
    echo "Bye"
    exit 0;
fi

echo "Gå til https://github.com/settings/tokens og lav en api nøgle"
echo "Installerer hub"
choco install hub -y
echo "Installerer kdiff3"
choco install kdiff3 -y

echo "Indtast github brugernavn"
read USER
if [ -z "$USER" ]; then
    echo "Bruger mangler"
    exit 1
fi
echo "Indtast github Access Token"
read TOKEN
if [ -z "$TOKEN" ]; then
    echo "AccessToken mangler"
    exit 1
fi

sed -e "s/{{USER}}/$USER/g; s/{{TOKEN}}/$TOKEN/g" hub.tmpl >> hub
if [ -f ~/.config ]; then
    echo "config existerer"
fi



