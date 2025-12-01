FROM cgr.dev/chainguard/python:latest-dev AS dev

WORKDIR /app

RUN python -m venv venv
ENV PATH="/app/venv/bin":$PATH
COPY flask-app/requirements.txt requirements.txt
RUN pip install -r requirements.txt

FROM cgr.dev/chainguard/python:latest

WORKDIR /app

COPY flask-app/dummy-endpoint.py /app/dummy-endpoint.py
COPY --from=dev /app/venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

EXPOSE 5000
ENTRYPOINT ["python3", "-m", "gunicorn", "-b", "0.0.0.0:5000", "dummy-endpoint:app"]