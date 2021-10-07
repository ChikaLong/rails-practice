class WriteCommentsController < ApplicationController
  def create
    @write = Write.find(params[:write_id])
    @comment = current_user.write_comments.new(write_comment_params)
    @comment.write_id = @write.id
    @comment.save
    redirect_to write_path(@write)
  end

  def destroy
    WriteComment.find_by(id: params[:id]).destroy
    redirect_to write_path(params[:write_id])
  end

  private
  def write_comment_params
    params.require(:write_comment).permit(:comment)
  end
end
