FROM python:3.9-alpine
COPY app-code /app-code
WORKDIR /app-code
RUN pip install -r requirements.txt
RUN apk --update add redis
EXPOSE 8000
CMD export $(cat .env | xargs) && redis-server --daemonize yes && python hello.py