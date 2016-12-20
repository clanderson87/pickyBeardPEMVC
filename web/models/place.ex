defmodule PickyBeardPEMVC.Place do
  use PickyBeardPEMVC.Web, :model

  schema "places" do
    field :name, :string
    field :location, :string
    field :cuisene, :string
    many_to_many :fans, PickyBeardPEMVC.User, join_through: "favorites"
  end

  def changeset(struct, params \\%{}) do
    struct
    |> cast(params, [:name, :location, :cuisene])
    |> validate_required([:name, :location, :cuisene])
  end
end