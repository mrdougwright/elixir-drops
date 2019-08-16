defmodule WeatherAppWeb.Router do
  use Phoenix.Router
  import Plug.Conn

  get("/", WeatherAppWeb.HomeController, :index)
end
