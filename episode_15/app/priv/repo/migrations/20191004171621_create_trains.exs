defmodule Trains.Repo.Migrations.CreateTrains do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add(:name, :string)
      add(:make, :string)
      add(:num, :integer)
    end
  end
end
