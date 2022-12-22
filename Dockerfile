# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8501

#RUN virtualenv /env -p python3.9

#ENV VIRTUAL_ENV /env
#ENV PATH /env/bin:$PATH

WORKDIR /app

ADD requirements.txt /app/

RUN apt-get update -y && apt-get install -y \
    build-essential gcc \
    apt-utils \
    gcc \
    libpq-dev \
    libsndfile-dev \
    software-properties-common \
    ffmpeg \
    libsndfile1-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip3 install -r requirements.txt

ADD . /app

ENTRYPOINT ["streamlit", "run", "MLAccentRecognizer.py", "--server.port", "8080"]