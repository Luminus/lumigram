class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_post, only: [:new, :create]
  before_action :set_comment, only: [:destroy]

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: 'Comment successfully added'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @post = @comment.post
    @comment.destroy
    redirect_to @post, notice: 'Comment deleted successfully'
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
