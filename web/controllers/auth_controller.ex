defmodule PickyBeardPEMVC.AuthController do
  use PickyBeardPEMVC.Web, :controller
  plug Ueberauth

  alias PickyBeardPEMVC.User

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    IO.inspect(auth)
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: Atom.to_string(auth.provider), name: auth.info.name}
    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "glad you're here!")
        |> put_session(:user_id, user.id)
        |> redirect(to: page_path(conn, :index)) ## update with correct path in future
      {:error, reason} ->
        IO.inspect(reason)
        conn
        |> put_flash(:error, "sumthin bad happened :(")
        |> redirect(to: page_path(conn, :index)) ## update with correct path in future
    end
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index)) ##update with correct path in future
  end

end