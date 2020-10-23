FROM "elixir:otp-22"

ARG APP_PATH=./hello/
ARG ENTRYPOINT_PATH=./docker/hello/entrypoint.sh
ARG PHX_VERSION=1.5.6
ARG WORKDIR=/usr/src/app/

# Install postgres and node
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get update && apt-get install --yes \
      nodejs                                \
      postgresql-client

# Install phoenix
RUN mix local.hex --force
RUN mix archive.install --force hex phx_new $PHX_VERSION
RUN mix local.rebar --force

WORKDIR $WORKDIR

# Install node dependencies + webpack
COPY $APP_PATH/assets ./assets/
RUN cd assets/ && npm --yes install

# Install phoenix dependencies
COPY $APP_PATH/mix.exs .
RUN mix deps.get --force

# Copy application
COPY $APP_PATH .

# Execute entrypoint
COPY $ENTRYPOINT_PATH /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
