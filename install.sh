curl https://dl.google.com/linux/linux_signing_key.pub \
    | sudo gpg --dearmon -o /etc/apt/trusted.gpg.d/chrome-remote-desktop.gpg
echo "deb [arch=amd64] https://dl.google.com/linux/chrome-remote-desktop/deb stable main" \
    | sudo tee /etc/apt/sources.list.d/chrome-remote-desktop.list
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes chrome-remote-desktop
    
 $1 --pin=123456
 
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver
    
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'
sudo systemctl disable lightdm.service
sudo apt install --assume-yes task-xfce-desktop

echo "export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1600x1200,3840x2560" \
    >> ~/.profile
    
echo "/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop" >> ~/.bashrc
echo "/opt/google/chrome-remote-desktop/chrome-remote-desktop --start" >> ~/.bashrc

