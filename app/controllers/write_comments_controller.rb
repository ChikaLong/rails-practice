class WriteCommentsController < ApplicationController
  def create
    @write = Write.find(params[:write_id])
    @write_comment = WriteComment.new
    write_comment = current_user.write_comments.new(write_comment_params)
    write_comment.write_id = @write.id
    unless write_comment.save
      render :show
    end
  end

  def destroy
    @write = Write.find(params[:write_id])
    @write_comment = @write.write_comments.find(params[:id])
    @write_comment.destroy
  end

  private
  def write_comment_params
    params.require(:write_comment).permit(:comment)
  end
end
