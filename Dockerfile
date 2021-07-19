FROM python:3.9.6-slim-buster
WORKDIR /flasky
RUN mkdir -p /flasky/app
RUN mkdir -p /flasky/migrations
RUN mkdir -p /flasky/tests
COPY ./requirements.txt /flasky/
COPY ./app  /flasky/app/
COPY ./migrations /flasky/migrations/
COPY ./tests /flasky/tests/
COPY ./flasky.py /flasky/
COPY ./config.py /flasky/
COPY ./data.sqlite /flasky/
COPY ./data-dev.sqlite /flasky/
RUN python -m venv venv
RUN chmod 777 -R /flasky/venv/bin/activate
RUN /flasky/venv/bin/activate
RUN pip install -r requirements.txt
EXPOSE 5000
ENV FLASK_APP=flasky.py
CMD [ "flask", "run", "--host=0.0.0.0"]
