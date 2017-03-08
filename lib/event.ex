defmodule Haqt.Event do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:json],
                     pass: ["application/json"],
                     json_decoder: Poison
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Haqt.Event, []
  end

  # these should take events match on eventType
  # and then call the appropriate actions
  post "/registration_event" do
    event = conn.body_params
    IO.inspect event

    conn
    |> send_resp(200, "Thank You")
    |> halt
  end

  def attendee_count do
    {:ok, Haqt.Registration.Actions.count_attendees}
  end

  def speaker_count do
    {:ok, Haqt.Registration.Actions.count_speakers}
  end

  def total_count do
    {:ok, Haqt.Registration.Actions.count_total}
  end
end
