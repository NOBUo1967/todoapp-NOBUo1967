class TasksController < ApplicationController

  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end
  
  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to board_path(board), notice: 'Task was added successfully!'
    else
      flash.now[:error] = 'Failed to add the task'
      render :new
    end
  end


  private
  def task_params
    params.require(:task).permit(:name, :description, :term, :eyecatch)
  end
end