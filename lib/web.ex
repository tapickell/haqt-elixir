defmodule Haqt.Web do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Haqt.Web, []
  end

  # these should take events match on eventType
  # and then call the appropriate actions
  get "/attendee_count" do
    {:ok, count} = Haqt.Registration.Actions.count_attendees

    conn
    |> send_resp(200, count)
    |> halt
  end

  get "/speaker_count" do
    {:ok, count} = Haqt.Registration.Actions.count_speakers

    conn
    |> send_resp(200, count)
    |> halt
  end

  get "/total_count" do
    {:ok, count} = Haqt.Registration.Actions.count_total

    conn
    |> send_resp(200, count)
    |> halt
  end

  match _ do
    conn
    |> send_resp(404, "Nothing here")
    |> halt
  end
end
