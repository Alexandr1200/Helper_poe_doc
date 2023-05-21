# Docker-команда FROM указывает базовый образ контейнера
# Наш базовый образ - это Linux с предустановленным python-3.10
FROM python:3.11

# Установим переменную окружения
ENV APP_HOME /app

# Установим рабочую директорию внутри контейнера
WORKDIR $APP_HOME

ADD main.py .
ADD Bot.py .
ADD AddressBook.py .
ADD info.py .
ADD auto_save.bin .
ADD logs.txt .

COPY . .

RUN pip install -r requirements.txt

# Обозначим порт где работает приложение внутри контейнера
EXPOSE 5000

# Запустим наше приложение внутри контейнера
CMD ["python3", "main.py"]