class FavoritesController < ApplicationController

  def create
    @write = Write.find(params[:write_id])
    favorite = current_user.favorites.new(write_id: @write.id)
    favorite.save
  end

  def destroy
    @write = Write.find(params[:write_id])
    favorite = current_user.favorites.find_by(write_id: @write.id)
    favorite.destroy
  end
end
