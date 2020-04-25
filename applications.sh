. /etc/os-release # get system details for linux name

if [ $ID == "ubuntu" ] # start if for ubuntu
then
    echo "start for first installation"
    sudo apt-get install git docker docker-compose 
    echo "finish for first installation"

    echo "start for spotify"
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install spotify-client
    echo "finish for spotify"

    echo "start for chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt-get install -f #deb dosya  kurulumundan sonraki bağımlılıkları indirir
    sudo rm -rf google-chrome-stable_current_amd64.deb
    echo "finish for chrome"

    echo "start jetbrains toolbox"
    wget https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh
    ./jetbrains-toolbox
    echo "finish jetbrains toolbox"

    echo "start gnome-tweak-tools"
    sudo add-apt-repository universe
    sudo apt install gnome-tweak-tool
    echo "finish gnome-tweak-tools"



elif [ $2 == 'centos' ]
then
    echo "start for first installation"
    sudo yum install git docker docker-compose 
    echo "finish for first installation"

    echo "start for spotify"
    #sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
    #echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo yum update
    sudo yum install spotify-client
    echo "finish for spotify"

    echo "start for chrome"
    #wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    #sudo dpkg -i google-chrome-stable_current_amd64.deb
    #sudo apt-get install -f #deb dosya  kurulumundan sonraki bağımlılıkları indirir
    #sudo rm -rf google-chrome-stable_current_amd64.deb
    echo "finish for chrome"
fi

echo "start for docker usermod"
sudo usermod -aG docker $USER
echo "finish for docker usermod"

git clone https://gitlab.com/onuragtas/docker.git
cd docker
cp docker-compose.yaml.dist docker-compose.yaml