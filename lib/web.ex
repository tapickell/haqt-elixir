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

  def response(conn, {:ok, resp}) do
    conn
    |> send_resp(200, resp)
    |> halt
  end

  def response(conn, {:error, _}) do
    conn
    |> send_resp(404, "Nothing to see here, move along.")
    |> halt
  end

  def handle_event_type(conn, event) do
    case event do
      %{"eventType" => "attendee_count"} ->
        response(conn, Haqt.Registration.Actions.count_attendees)
      %{"eventType" => "speaker_count"} ->
        response(conn, Haqt.Registration.Actions.count_speakers)
      %{"eventType" => "total_count"} ->
        response(conn, Haqt.Registration.Actions.count_total)
      %{"eventType" => _} ->
        response(conn, {:error, "Nope"})
    end
  end

  # event driven endpoint
  post "/registration_event" do
    handle_event_type(conn, conn.body_params)
  end

  # rest like api
  get "/attendee_count" do
    response(conn, Haqt.Registration.Actions.count_attendees)
  end

  get "/speaker_count" do
    response(conn, Haqt.Registration.Actions.count_speakers)
  end

  get "/total_count" do
    response(conn, Haqt.Registration.Actions.count_total)
  end

  match _ do
    response(conn, {:error, "Nope"})
  end
end
