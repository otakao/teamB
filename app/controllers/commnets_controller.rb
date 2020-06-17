def create
  @comment = Comment.new(content: comment_params[:content] ,item_id: comment_params[:item_id] ,user_id:current_user.id )
  if @comment.save
     respond_to do |format|
       format.json
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
