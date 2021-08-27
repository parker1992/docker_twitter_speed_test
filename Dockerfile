FROM python:3.6.14-alpine3.14
RUN apk add --no-cache bash tzdata
WORKDIR /app
COPY entrypoint.sh entrypoint.sh
RUN chmod 755 entrypoint.sh
RUN wget https://github.com/parker1992/twitter_speed_test/archive/refs/heads/master.zip
RUN unzip -j master.zip
RUN pip install -r requirements.txt
ENTRYPOINT /bin/bash ./entrypoint.sh

