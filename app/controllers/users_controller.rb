class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:friendly_id])

    @posts = @user.posts
  end

end
