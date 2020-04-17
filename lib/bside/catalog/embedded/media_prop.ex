defmodule Bside.Catalog.Embedded.MediaProp do
  @moduledoc """
  MediaProp embedded definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string
    field :url, :string
    field :type, :string
  end

  @doc false
  def changeset(media, attrs) do
    media
    |> cast(attrs, [
      :name,
      :url,
      :type
    ])
    |> validate_required([
      :name,
      :url,
      :type
    ])
  end
end
