defmodule Haqt.Web do
  use Plug.Router
  require Logger

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
    |> send_resp(200, resp)
    |> halt
  end

  def response({:error, _}, conn) do
    conn
    |> send_resp(404, "Nothing to see here, move along.")
    |> halt
  end

  post "/registration_event" do
    Haqt.Registration.Handler.handle_event_type(conn.body_params)
    |> response(conn)
  end

  match _ do
    {:error, "Nope"}
    |> response(conn)
  end
end
