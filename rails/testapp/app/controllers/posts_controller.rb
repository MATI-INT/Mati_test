class PostsController < ApplicationController
  def destroy
    @post = Post.find_by_id(params[:id])
    if @post
      @post.destroy
    end
    redirect_to root_url
  end

  def edit
    @post = Post.find_by_id(params[:id])
    if @post
      render 'edit'
    else
      redirect_to root_url
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @posts = Post.order('created_at DESC')
  end

  def show
    @post = Post.find_by_id(params[:id])
    # GET /posts/:id(.:format) posts#show
    if @post
      render 'show'
    else
      redirect_to root_url
    end
  end
end