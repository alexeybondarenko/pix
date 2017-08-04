defmodule PixWeb.Router do
  use PixWeb, :router

  scope "/", PixWeb do
    get "/picture/*url", PictureController, :index
  end
end
