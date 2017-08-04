defmodule PixWeb.PictureController do
  use PixWeb, :controller

  defp takePrefix(full, prefix) do
    base = String.length(prefix);
    String.slice(full, base.. - 1);
  end

  def index(conn, %{"url" => url}) do
    case HTTPoison.get(takePrefix conn.request_path, "/picture/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        text conn, body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        text conn, "Not found :("
      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        text conn, status_code
      {:error, %HTTPoison.Error{reason: reason}} ->
        text conn, reason
    end
  end
end
