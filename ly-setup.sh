!#/bin/bash
cd ly; make github;
make
sudo make install
# disable the current display manager
sudo systemctl disable display-manager.service
sudo systemctl enable ly.service
