defmodule PickyBeardPEMVC.Repo.Migrations.AddGroupsAndAddGroupFieldsOnMembers do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
    end

    alter table(:users) do
      add :member_of, references(:groups)
    end

    alter table(:groups) do
      add :members, references(:users)
    end
  end
end
