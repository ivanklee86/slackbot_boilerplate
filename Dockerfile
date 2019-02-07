# Base image
# ---------------------------------------------------------------------- #
FROM python:3.7
LABEL MAINTAINER="Ivan Lee <ivan@aaptiv.com>"

# Copy app files into the docker image
# ---------------------------------------------------------------------- #
RUN mkdir /csa
WORKDIR /csa
COPY . /csa

# Install dependencies
# ---------------------------------------------------------------------- #
RUN pip install pipenv
RUN pipenv install --system --deploy

# Container settings
# ---------------------------------------------------------------------- #
ENV PYTHONPATH=/csa

# Start bot.
# ---------------------------------------------------------------------- #
CMD ["python", "./app/run.py"]