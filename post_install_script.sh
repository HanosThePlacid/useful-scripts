#!/bin/bash

# Function to check and install if needed
install_if_missing() {
    dpkg -l | grep -qw "$1" || sudo apt-get install -y "$1"
}

# Update system and install general dependencies
echo "Updating package list..."
sudo apt-get update

# Install curl
echo "Installing curl..."
install_if_missing "curl"

# Install Git
echo "Installing Git..."
install_if_missing "git"

# Install Docker
echo "Installing Docker..."
install_if_missing "docker.io"
# Install Docker dependencies
echo "Installing Docker dependencies..."
install_if_missing "apt-transport-https"
install_if_missing "ca-certificates"
install_if_missing "curl"
install_if_missing "software-properties-common"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Java (OpenJDK 11 as an example)
echo "Installing OpenJDK..."
sudo apt-get install -y openjdk-11-jdk

# Install .NET SDK
echo "Installing .NET SDK..."
install_if_missing "dotnet-sdk-6.0"

# Install Python 3 and pip3
echo "Installing Python 3 and pip3..."
install_if_missing "python3"
install_if_missing "python3-pip"

# Install Visual Studio Code (VSCode)
echo "Installing Visual Studio Code..."
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
install_if_missing "code"

# Install Teams (Microsoft Teams for Linux)
echo "Installing Microsoft Teams..."
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl -L https://packages.microsoft.com/repos/microsoft-debian-stable.list | sudo tee /etc/apt/sources.list.d/microsoft.list
sudo apt-get update
install_if_missing "teams"

# Install Opera
echo "Installing Opera..."
curl -fsSL https://deb.opera.com/archive.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/opera-archive-keyring.gpg
echo "deb https://deb.opera.com/opera-stable/ stable non-free" | sudo tee /etc/apt/sources.list.d/opera-stable.list
sudo apt-get update
install_if_missing "opera-stable"

# Install GNU Image Manipulation Program (GIMP)
echo "Installing GIMP..."
install_if_missing "gimp"

# Install ktorrent
echo "Installing KTorrent..."
install_if_missing "ktorrent"

# Install MultiMC (Minecraft launcher)
echo "Installing MultiMC..."
wget -qO - https://multimc.org/downloads/multimc-linux64.tar.gz | sudo tar -xz -C /opt

# Install Master PDF Editor
echo "Installing Master PDF Editor..."
wget https://code-industry.net/public/master-pdf-editor-5.deb
sudo dpkg -i master-pdf-editor-5.deb
sudo apt-get install -f  # Install dependencies if needed

# Install Discord
echo "Installing Discord..."
install_if_missing "discord"

# Install Vim
echo "Installing Vim..."
install_if_missing "vim"

echo "All packages have been installed!"
