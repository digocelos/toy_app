defmodule ToyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ToyApp.Posts.Microposts

  schema "users" do
    field :name, :string
    field :email, :string

    has_many :microposts, Microposts

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
