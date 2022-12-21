class CommentsController < ApplicationController
  def create
    @plan = Plan.find(params[:plan_id])
    @comment = current_user.comments.build(comment_params)
    @comment.plan_id = @plan.id

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to plan_path(@plan), notice: '投稿できませんでした...' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :plan_id)
  end
end
