class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post created successfully'
    else
      render 'new'
    end
  end

  def show
  end

  def edit  
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def like
    @post.upvote_by current_user
    redirect_to :back
  end

  def unlike
    @post.downvote_by current_user
    redirect_to :back
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:comment, :image)
    end
end
