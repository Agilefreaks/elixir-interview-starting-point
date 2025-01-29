defmodule ElixirTodosWeb.Schema.Query.MainTest do
  use ElixirTodosWeb.ConnCase

  @query """
  query {
    main {
      hello
    }
  }
  """
  test "main query returns success" do
    response = post(build_conn(), "/graphql", query: @query)

    assert json_response(response, 200) == %{
             "data" => %{
               "main" => %{
                 "hello" => "world"
               }
             }
           }
  end
end
