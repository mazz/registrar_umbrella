FROM bitwalker/alpine-elixir-phoenix:1.9.0 as releaser

WORKDIR /app

# Install Hex + Rebar
RUN mix do local.hex --force, local.rebar --force

COPY config/ /app/config/
COPY mix.exs /app/
COPY mix.* /app/

COPY apps/registrar/mix.exs /app/apps/registrar/
COPY apps/registrar_web/mix.exs /app/apps/registrar_web/

ENV MIX_ENV=prod
# docker build --build-arg DATABASE_URL=ecto://postgres:postgres@localhost/registrar_dev
ENV DATABASE_URL=ecto://postgres:postgres@localhost/registrar_dev
ENV SECRET_KEY_BASE=PV4tK6d7I3TTaygeCuaFSaZuQgmO6Lz9twMo5GSVDn4TW2+R2/ycQnzBx/20TfBt
RUN mix do deps.get --only $MIX_ENV, deps.compile

COPY . /app/


WORKDIR /app/apps/registrar_web
RUN MIX_ENV=prod mix compile
RUN npm install --prefix ./assets
RUN npm run deploy --prefix ./assets
RUN mix phx.digest

WORKDIR /app
RUN MIX_ENV=prod mix release

########################################################################

FROM bitwalker/alpine-elixir-phoenix:1.9.0

EXPOSE 4000
ENV PORT=4000 \
    MIX_ENV=prod \
    SHELL=/bin/bash

WORKDIR /app
COPY --from=releaser app/_build/prod/rel/registrar_umbrella .
COPY --from=releaser app/bin/ ./bin

CMD ["./bin/start"]

# RUN chmod +x /app/bin/docker-entrypoint.sh
# CMD ["/app/bin/docker-entrypoint.sh"]

# docker build -t mhanna/registrar .
# docker run -p 4000:4000 -p 5432:5432 --env COOL_TEXT='ELIXIR ROCKS!!!!' --env SECRET_KEY_BASE=PV4tK6d7I3TTaygeCuaFSaZuQgmO6Lz9twMo5GSVDn4TW2+R2/ycQnzBx/20TfBt mhanna/registrar:latest
