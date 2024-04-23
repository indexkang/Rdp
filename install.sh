sudo DEBIAN_FRONTEND=noninteractive \
  sudo apt update && sudo apt upgrade -y
  
sudo DEBIAN_FRONTEND=noninteractive \
  sudo apt install xfce4 -y
  
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb -P /tmp
sudo apt install --assume-yes /tmp/chrome-remote-desktop_current_amd64.deb
    
 $1 --pin=123456
 
sudo DEBIAN_FRONTEND=noninteractive \
    sudo apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
    
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service
sudo apt install --assume-yes task-xfce-desktop

echo "export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1600x1200,3840x2560" \
    >> ~/.profile
    
echo "/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop" >> ~/.bashrc
echo "/opt/google/chrome-remote-desktop/chrome-remote-desktop --start" >> ~/.bashrc

