FROM postgres:13.2-alpine
ENV POSTGRES_USER deandraper
ENV POSTGRES_PASSWORD spacework1821
COPY ./schema.sql /docker-entrypoint-initdb.d/schema.sql
