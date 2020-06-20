class CommentsController < ApplicationController

    def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item.id)
      #  respond_to do |format|
      #    format.json
      end
    else
      flash[:alert] = "保存できていません"
      redirect_to item_path(params[:id])
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content,:item_id).merge(user_id: current_user.id)
    end
  end
end
