defmodule Kangarfc.Ads.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :contact_info, :string
    field :delivery_area, :string
    field :delivery_time, :string
    field :extra_info, :string
    field :location, :string
    field :menu, :string
    field :name, :string
    field :image, :string
    
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:name, :location, :menu, :delivery_area, :delivery_time, :contact_info, :extra_info, :image])
    |> validate_required([:name, :location, :menu, :delivery_area, :delivery_time, :contact_info, :extra_info, :image])
  end
end
