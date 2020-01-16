# Fmzn


##Docker
`docker build -t fmzn-app .`

`docker-compose -f docker-compose.yml up`

`docker images`

`docker ps` - get running processes

Log into running container - `docker exec -it 0d990bf3a2cb /bin/bash`


##Notes


Insert products - `mix run insert_products.exs`
(In prod - go to `/load`)


In container - start App cmd `bin/fmzn start`

(See `entry.sh`)


### Mix release (local)
`_build/prod/rel/fmzn/bin/fmzn start`

`_build/prod/rel/fmzn/bin/fmzn eval Fmzn.Release.migrate`


### Heroku

Build - `heroku container:push web`

Deploy - `heroku container:release web`

`heroku logs --tail`


https://dev.to/ilsanto/deploy-a-phoenix-app-with-docker-stack-1j9c

Form for product suggestions:

https://docs.google.com/forms/d/e/1FAIpQLSeHkoeakFXnlQO0wc4B7cwLvwvTiPbkDuHyY1O7ddHrtA3h-w/viewform?usp=sf_link

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
