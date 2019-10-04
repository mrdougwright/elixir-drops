defmodule Trains.Car do
  use Ecto.Schema

  schema "cars" do
    field(:name, :string)
    field(:make, :string)
    field(:num, :integer)
  end

  def changeset(car, params \\ %{}) do
    car
    |> Ecto.Changeset.cast(params, [:name, :make, :num])
    |> Ecto.Changeset.validate_required([:name])
  end
end
