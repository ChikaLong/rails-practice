class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @writes = @user.writes
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def favorites
    favorites = Favorite.where(user_id: current_user.id).pluck(:write_id)
    @favorite_writes = Write.find(favorites)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
