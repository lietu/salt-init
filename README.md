# salt-init

Personal fork and example of
[https://github.com/lietu-org/salt-init](https://github.com/lietu-org/salt-init)
usage.

You probably don't want to use this repository directly for anything.

## Usage

As a sudo-able user on a new server:
```
sudo yum install -y git || sudo apt-get install -y git
git clone --recursive https://github.com/lietu/salt-init.git
cd salt-init

sudo ./initialize.sh
# Or
sudo ./initialize.sh twitch-quote-bot/salt/roots/salt/
```
