# app/Dockerfile

FROM python:3.9-slim

EXPOSE 8080



RUN apt-get update -y && apt-get install -y \
    python3.9 \
    python3-pip \
    build-essential gcc \
    apt-utils \
    gcc \
    libpq-dev \
    libsndfile-dev \
    software-properties-common \
    ffmpeg \
    libsndfile1-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

COPY . .

#RUN pip3 install virtualenv

#RUN virtualenv /env

#ENV VIRTUAL_ENV /env
#ENV PATH /env/bin:$PATH
ADD requirements.txt /app/
RUN python3 --version
RUN pip3 install --no-cache-dir -r requirements.txt

ADD . /app

ENTRYPOINT ["streamlit", "run", "MLAccentRecognizer.py", "--server.port", "8080"]