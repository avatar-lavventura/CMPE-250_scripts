# CMPE-250_scripts

## Requirements

```bash
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install requests
```

## Run

```bash
mkdir CMPE250 && cd CMPE250
echo "my_github_password" > password.txt
curl -O https://gist.githubusercontent.com/avatar-lavventura/9bc3a474c1c5fef8dfb7b4f4e415bf8f/raw/gh_classroom_collect.py
python gh_classroom_collect.py "CMPE250-Fall-2017-Bogazici" "project1" project-1 --user avatar-lavventura --token password.txt
```
