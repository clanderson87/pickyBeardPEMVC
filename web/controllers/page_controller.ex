defmodule PickyBeardPEMVC.PageController do
  use PickyBeardPEMVC.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
