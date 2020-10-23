class TasksController < ApplicationController

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end
  
  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(board), notice: 'Task was added successfully!'
    else
      flash.now[:error] = 'Failed to add the task'
      render :new
    end
  end


  private
  def task_params
    params.require(:task).permit(:name, :description).merge(user_id: current_user.id)
  end
end