FROM python:2.7
MAINTAINER Alex Yoo "ay244@cornell.edu"

WORKDIR /usr/src/app

RUN git clone https://github.com/wpfjtmwls/CUMemeApp.git /usr/src/app

RUN pip install git+https://github.com/cuappdev/appdev.py.git --upgrade
RUN pip install -r requirements.txt

EXPOSE 5000
CMD sh run.sh