# Fmzn

Insert products - `mix run insert_products.exs`

`mix ecto.create`

`mix ecto.migrate`

run docker - `docker run -i -t -p 4000:4000 fmzn_web`

start App cmd `bin/fmzn start`
`_build/prod/rel/fmzn/bin/fmzn start`

`_build/prod/rel/fmzn/bin/fmzn eval Fmzn.Release.migrate`

`docker-compose build`

`docker-compose up`

`docker-compose down`

`docker-compose kill`

https://dev.to/ilsanto/deploy-a-phoenix-app-with-docker-stack-1j9c

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
