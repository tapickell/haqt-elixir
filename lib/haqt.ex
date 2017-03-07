defmodule Haqt do
  use Application

  def start(type, args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Haqt.Web, [])
    ]

    opts = [strategy: :one_for_one, name: Haqt.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

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

  get "/" do
    conn
    |> send_resp(200, "ok")
    |> halt
  end
end
