FROM python:3.9-alpine
WORKDIR /code
COPY ./requirements.txt /code/
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY ./code /code/server
CMD ["uvicorn", "server.main:app", "--host", "0.0.0.0", "--port", "8080"]


