defmodule BsideWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :bside

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_bside_key",
    signing_salt: "gmOXoV+D"
  ]

  socket "/socket", BsideWeb.UserSocket,
    websocket: true,
    longpoll: false

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phx.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/",
    from: :bside,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  # Cors configuration
  plug Corsica,
    origins: [
      "http://localhost:4000",
      "http://localhost:3000",
      ~r{^http?://(.*\.?)perfecty\.co$}
    ],
    allow_headers: :all,
    log: []

  plug Plug.Session, @session_options
  plug BsideWeb.Router
end
