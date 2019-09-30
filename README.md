# DemoFixtures

## Introduction

Each branch match one step of my presentation.
You can find the presentation here:

## How to start

To start your Phoenix server:

  * Build your docker container with `docker-compose build`
  * Run your postgresql container with `docker-compose up -d postgres`
  * Get the IP of your docker container with
    ```
    $> docker ps
    $> docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [ID_POSTGRES_CONTAINER]
    ```
  * In the .env file, put the IP in the `host` field
  * Run your elixir container with `docker-compose up elixir` (you can silence it with the `-d` param before `elixir`)

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
