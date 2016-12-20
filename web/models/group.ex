defmodule PickyBeardPEMVC.Group do
  use PickyBeardPEMVC.Web, :model

  schema "groups" do
    field :name, :string
    many_to_many :members, PickyBeardPEMVC.User, join_through: "user_id"
    many_to_many :admins, PickyBeardPEMVC.User, join_through: "admin_of"
  end

  def changeset(struct, params \\%{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end