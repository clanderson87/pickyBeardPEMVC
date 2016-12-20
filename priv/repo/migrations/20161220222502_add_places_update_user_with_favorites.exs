defmodule PickyBeardPEMVC.Repo.Migrations.AddPlacesUpdateUserWithFavorites do
  use Ecto.Migration

  def change do
    create table(:places) do
      add :name, :string
      add :location, :string
      add :cuisene, :string
      add :fans, references(:users)

      timestamps()
    end

    alter table(:users) do
      add :favorites, references(:places)
    end

  end
end
