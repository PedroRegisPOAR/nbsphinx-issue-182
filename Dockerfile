FROM python:3.6.6

COPY requirements.txt /requirements.txt

RUN pip3 install --upgrade pip \
&& pip3 install -r requirements.txt \
&& rm -r /root/.cache/pip

# Not optimized way to install pandoc
RUN apt-get update && apt-get install pandoc -y
RUN mkdir code

WORKDIR /code
