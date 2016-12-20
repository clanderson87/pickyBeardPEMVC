defmodule PickyBeardPEMVC.User do
  use PickyBeardPEMVC.Web, :model

  schema "users" do 
    field :email, :string
    field :name, :string
    field :provider, :string
    field :token, :string
    many_to_many :member_of, PickyBeardPEMVC.Group, join_through: "group_id"
    many_to_many :admin_of, PickyBeardPEMVC.Group, join_though: "admins"

    timestamps()
  end

  def changeset(struct, params\\ %{}) do
    struct
    |> cast(params, [:email, :name, :provider, :token])
    |> validate_required([:email, :name, :provider, :token])
  end
end