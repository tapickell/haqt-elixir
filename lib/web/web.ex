defmodule Haqt.Web do
  use Plug.Router
  require Logger
  alias Haqt.Registration.Handler

  plug Plug.Logger
  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Haqt.Web, []
  end

  def response({:ok, resp}, conn) do
    conn
    |> send_resp(200, inspect(resp))
    |> halt
  end

  def response({:error, _}, conn) do
    conn
    |> send_resp(404, "Nothing to see here, move along.")
    |> halt
  end

  post "/registration_event" do
    conn.body_params
    |> AtomicMap.convert
    |> Handler.handle_event_type
    |> response(conn)
  end

  match _ do
    {:error, "Nope"}
    |> response(conn)
  end
end
