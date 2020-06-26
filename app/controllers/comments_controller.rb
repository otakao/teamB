class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html {redirect_to item_path(params[:item_id]) }
      format.json 
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = 'コメントを削除しました'
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end