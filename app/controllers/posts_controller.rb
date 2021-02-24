class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC") #  すべてのレコードを@postsに代入
  end 

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.undate(checked: false)
    else
      post.update(cfecked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end