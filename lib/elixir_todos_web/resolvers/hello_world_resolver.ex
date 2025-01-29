defmodule ElixirTodosWeb.Resolvers.HelloWorldResolver do
  def hello(_root, _args, _info) do
    {:ok, %{hello: "world"}}
  end
end
