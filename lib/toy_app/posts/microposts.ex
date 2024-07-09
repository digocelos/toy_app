defmodule ToyApp.Posts.Microposts do
  alias Hex.API.User
  use Ecto.Schema
  import Ecto.Changeset

  schema "microposts" do
    field :content, :string
    belongs_to :user, User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(microposts, attrs) do
    microposts
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content, :user_id])
    |> validate_length(:content, max: 280)
  end
end
