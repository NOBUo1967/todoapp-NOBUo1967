class CommentsController < ApplicationController

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:task_id])
    @comment = @task.comments.build
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:task_id])
    @comment = @task.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to board_task_path(@board, @task), notice: 'Comment was added successfully!'
    else
      flash.now[:error] = 'Failed to add the comment'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end