# README


This repo has been created to demonstrate how one could use Mnesia, with Ecto, in
place of the typical database of Postgres or MySQL.  The repo will be used as part
of a demo/presentation taking place in September 2018 for the JaxEx Meetup.



## Requirements

  * Elixir 1.6+ 
  * Phoenix 1.3+
  * Postgres 9.3.x (initially, though we will swap that out)
  * NPM


Install the following, if needed:

  ```
  # Install Elixir 
  brew install elixir (if on OS X) or your preferred method
  ```

Note:  See the following for alternative ways to install [Elixir](https://elixir-lang.org/install.html)



Install Hex Package Manager:

  ```
  mix local.hex
  ```



Install Phoenix:

  ```
  mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
  ```



Update NPM

  ```
  npm upgrade
  ```



## Clone the repo

  ```
  cd /path/to/your/elixir/projects
  git clone https://github.com/hogihung/metademo_mnesia.git 
  ```


## Getting Started

  ```
  cd metademo_mnesia
  mix deps.get
  mix ecto.create
  mix ecto.migrate
  ```



## Test things out

Run the server:

  ```
  iex -S mix phx.server
  ```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.



## Seed The App With Some Data Using Curl

  - Open the file Seed\_Data\_Via\_Curl\_Post.txt in your favorite text editor
  - Copy the curl examples that are doing a POST
  - Paste those values into a terminal that can hit the Web App you started previously
  - Via the browser, visit http://localhost:4000/api/hosts     (view list of all hosts in DB)
  - Via the browser, visit http://localhost:4000/api/hosts/1   (view one host)


**TIP:** Reset the database:

  ```
  mix ecto.drop
  mix ecto.create
  mix ecto.migrate
  ```


## Switch Over To Using Mnesia

  ```
  # Stop the Phoenix Server:
  cntrl+c / cntrl+c

  # Change to Mnesia related branch:
  git checkout convert_db_to_mnesia 

  # Pull in new dependencies:
  mix deps.get

  # Create the database for Mnesia
  mkdir -p priv/data/mnesia
  mix ecto.create

  # Re-Run the migrations
  mix ecto.migrate

  # Re-start the Phoenix App
  iex -S mix phx.server
  ```



## Learn more

  * Article: [A Trip Down Mnesia Lane](https://medium.com/@hogihung/a-trip-down-mnesia-lane-bb4549c74bf9)
  * [Erlang Mnesia Overview](http://erlang.org/doc/apps/mnesia/Mnesia_overview.html)
  * [Ecto Adapter for Mnesia](https://hexdocs.pm/ecto_mnesia/readme.html)
  * Ecto Mnesia Repo on [Github](https://github.com/Nebo15/ecto_mnesia)
  * Ecto [Query](https://hexdocs.pm/ecto/Ecto.Query.html#content)
  * Ecto [Repo](https://hexdocs.pm/ecto/Ecto.Repo.html#c:get!/3)
  * Ecto [Associatons](https://hexdocs.pm/ecto/associations.html#one-to-many)
  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).
