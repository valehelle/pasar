defmodule Kangarfc.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :location, :string
      add :menu, :text
      add :delivery_area, :text
      add :delivery_time, :text
      add :contact_info, :string
      add :extra_info, :string
      add :image, :string

      timestamps()
    end

  end
end
