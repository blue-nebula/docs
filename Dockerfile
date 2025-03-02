FROM python:3-alpine as builder

RUN apk add --no-cache gcc musl-dev libffi-dev rust cargo openssl-dev poetry make git bash plantuml

# build as a regular user, not root, to avoid annoying warnings from pip
RUN adduser -S build
RUN install -d -m 0755 -o build /build
USER build
WORKDIR /build

COPY pyproject.toml /build/
COPY poetry.lock /build/

RUN poetry install

COPY --chown=build . .

RUN git config --global --add safe.directory /build

RUN poetry run make html


FROM nginx:alpine

LABEL org.opencontainers.image.source="https://github.com/blue-nebula/docs"

COPY docker/nginx.conf /etc/nginx/

# check nginx config
RUN nginx -t

COPY --from=builder /build/build/html/ /usr/share/nginx/html
