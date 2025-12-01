# devops-demo

## python
```bash
sudo apt install -y python3.12-venv
cd flask-app
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
flask --app dummy-endpoint run
```

## docker

```
docker build --no-cache -t JarnotMaciej/dummy-endpoint .
docker compose up -d
```
