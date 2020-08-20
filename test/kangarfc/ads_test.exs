defmodule Kangarfc.AdsTest do
  use Kangarfc.DataCase

  alias Kangarfc.Ads

  describe "posts" do
    alias Kangarfc.Ads.Post

    @valid_attrs %{contact_info: "some contact_info", delivery_area: "some delivery_area", delivery_time: "some delivery_time", extra_info: "some extra_info", location: "some location", menu: "some menu", name: "some name"}
    @update_attrs %{contact_info: "some updated contact_info", delivery_area: "some updated delivery_area", delivery_time: "some updated delivery_time", extra_info: "some updated extra_info", location: "some updated location", menu: "some updated menu", name: "some updated name"}
    @invalid_attrs %{contact_info: nil, delivery_area: nil, delivery_time: nil, extra_info: nil, location: nil, menu: nil, name: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Ads.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Ads.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Ads.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Ads.create_post(@valid_attrs)
      assert post.contact_info == "some contact_info"
      assert post.delivery_area == "some delivery_area"
      assert post.delivery_time == "some delivery_time"
      assert post.extra_info == "some extra_info"
      assert post.location == "some location"
      assert post.menu == "some menu"
      assert post.name == "some name"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ads.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Ads.update_post(post, @update_attrs)
      assert post.contact_info == "some updated contact_info"
      assert post.delivery_area == "some updated delivery_area"
      assert post.delivery_time == "some updated delivery_time"
      assert post.extra_info == "some updated extra_info"
      assert post.location == "some updated location"
      assert post.menu == "some updated menu"
      assert post.name == "some updated name"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Ads.update_post(post, @invalid_attrs)
      assert post == Ads.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Ads.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Ads.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Ads.change_post(post)
    end
  end
end
