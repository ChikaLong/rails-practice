class WritesController < ApplicationController
  def new
    @write = Write.new
  end

  def create
    @write = Write.new(write_params)
    @write.user_id = current_user.id
    @write.save
    redirect_to write_path(@write)
  end

  def index
    @writes = Write.all
    @user = current_user
  end

  def show
    @write = Write.find(params[:id])
    @user = @write.user
    @write_comment = WriteComment.new
  end

  def edit
    @write = Write.find(params[:id])
  end

  def update
    @write = Write.find(params[:id])
    @write.user_id = current_user.id
    @write.update(write_params)
    redirect_to writes_path(@write)
  end

  def destroy
    @write = Write.find(params[:id])
    @write.destroy
    redirect_to writes_path
  end

  private
  def write_params
    params.require(:write).permit(:title, :body, :image)
  end
end
