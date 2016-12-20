defmodule PickyBeardPEMVC.Repo.Migrations.AddAdminsToUsersAndGroups do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :admin_of, references(:groups)
    end

    alter table(:groups) do
      add :admins, references(:users)
    end
  end
end
