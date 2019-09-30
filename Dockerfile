# base image elixer to start with
FROM elixir:1.9

# install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

# install the latest phoenix
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez --force

# install node
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install nodejs
RUN apt-get install -y inotify-tools

# create app folder
RUN mkdir /app
COPY . /app
WORKDIR /app

# install dependencies
RUN mix deps.clean --all --unlock
RUN mix deps.get
RUN mix deps.compile

RUN cd assets && npm install && npm run build && cd ../ && mix phx.digest

CMD mix phx.server