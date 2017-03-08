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

  get "/attendee_count" do
    conn
    |> send_resp(200, "42")
    |> halt
  end

  get "/speaker_count" do
    conn
    |> send_resp(200, "4")
    |> halt
  end

  get "/total_count" do
    conn
    |> send_resp(200, "44")
    |> halt
  end

  match _ do
    conn
    |> send_resp(404, "Nothing here")
    |> halt
  end
end
