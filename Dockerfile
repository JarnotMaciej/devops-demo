FROM cgr.dev/chainguard/python:latest-dev

COPY flask-app/dummy-endpoint.py /app/dummy-endpoint.py
COPY flask-app/requirements.txt /app/requirements.txt
WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 5000
ENTRYPOINT ["python3", "-m", "gunicorn", "-b", "0.0.0.0:5000", "dummy-endpoint:app"]
