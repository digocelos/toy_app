defmodule ToyAppWeb.MicropostsHTML do
  use ToyAppWeb, :html

  embed_templates "microposts_html/*"

  @doc """
  Renders a microposts form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def microposts_form(assigns)
end
