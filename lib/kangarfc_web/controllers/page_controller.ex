defmodule KangarfcWeb.PageController do
  use KangarfcWeb, :controller
  alias Kangarfc.Ads
  alias Kangarfc.Ads.Post

  def index(conn, _params) do
    posts = Ads.list_posts_latest()
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"post_id" => post_id}) do
    post = Ads.get_post!(post_id)
    render(conn, "show.html", post: post)
  end

  def search(conn,  %{"q" => query}) do
    posts = Ads.find_post(query)
    render(conn, "search.html", posts: posts, query: query)
  end
  def search(conn,  _) do
    redirect(conn, to: Routes.page_path(conn, :index))
  end
  def new(conn, _params) do
    changeset = Post.changeset(%Post{},%{})
    render(conn, "new.html", changeset: changeset)
  end
  
  def create(conn, %{"post" => params}) do
    case Ads.create_post(params) do
      {:ok, post} -> redirect(conn, to: Routes.page_path(conn, :show, post.id))
      {:error, changeset } -> render(conn, "new.html", changeset: changeset)
    end
  end

  def admin(conn, _params) do
    posts = Ads.list_posts_latest()
    render(conn, "index.html", posts: posts)
  end
end
