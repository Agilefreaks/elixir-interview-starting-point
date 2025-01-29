defmodule ElixirTodosWeb.Schema do
  use Absinthe.Schema

  alias ElixirTodosWeb.Resolvers, as: R

  object :hello_world do
    field :hello, non_null(:string)
  end

  query do
    @desc "Get Main"
    field :main, non_null(:hello_world) do
      resolve(&R.HelloWorldResolver.hello/3)
    end
  end
end
