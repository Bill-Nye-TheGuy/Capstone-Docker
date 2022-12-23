# app/Dockerfile

FROM ubuntu

EXPOSE 8501

#RUN virtualenv /env -p python3.9

#ENV VIRTUAL_ENV /env
#ENV PATH /env/bin:$PATH

WORKDIR /app

ADD requirements.txt /app/

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

RUN pip3 install --no-cache-dir -r requirements.txt

ADD . /app

ENTRYPOINT ["streamlit", "run", "MLAccentRecognizer.py", "--server.port", "8080"]