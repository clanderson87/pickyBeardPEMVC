defmodule PickyBeardPEMVC.User do
  use PickyBeardPEMVC.Web, :model

  schema "users" do 
    field :email, :string
    field :name, :string
    field :provider, :string
    field :token, :string

    timestamps()
  end

  def changeset(struct, params\\ %{}) do
    struct
    |> cast(params, [:email, :name, :provider, :token])
    |> validate_required([:email, :name, :provider, :token])
  end
end