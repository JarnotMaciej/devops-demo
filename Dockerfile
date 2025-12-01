FROM ubuntu:noble

COPY flask-app/dummy-endpoint.py /app/dummy-endpoint.py
COPY flask-app/requirements.txt /app/requirements.txt
WORKDIR /app

RUN apt-get update && apt-get install -y python3 python3-pip && pip install -r requirements.txt --break-system-packages

EXPOSE 5000
CMD ["gunicorn", "-b", "0.0.0.0:5000", "dummy-endpoint:app"]
