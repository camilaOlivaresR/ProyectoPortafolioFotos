class CommentsController < ApplicationController
  before_action :authenticate_user!
 
  def create
    @picture = Picture.find(params[:comment][:picture_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to picture_path(@picture.id), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to  picture_path(@picture.id), notice: 'Comment was not created.' }
      end
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content, :picture_id)
  end

end
