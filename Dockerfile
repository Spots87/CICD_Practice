FROM python:3.9

WORKDIR /rest

COPY ./requirements.txt /rest/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /rest/requirements.txt

COPY ./app /rest/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
