FROM public.ecr.aws/docker/library/node:18.18-alpine3.17 as builder

LABEL maintainer="Anish Nath" \
      description="Simple Ping Pong Application" \
      cpu-usage="Low" \
      memory-usage="Low"\
      io-usage="Low"


COPY ./*.ts /home/node/app/src/
COPY ./package* /home/node/app/src/
COPY ./tsconfig* /home/node/app/src/
WORKDIR /home/node/app

RUN cd /home/node/app/src/ ; \
    npm install -g typescript; \
    npm ci; \
    tsc

FROM public.ecr.aws/docker/library/node:18.18-alpine3.17 as app

WORKDIR /home/node/app

RUN npm install pm2 -g

COPY --from=builder /home/node/app/src/dist .
COPY --from=builder /home/node/app/src/node_modules ./node_modules

EXPOSE 3000
USER nobody
CMD ["node", "app.js"]