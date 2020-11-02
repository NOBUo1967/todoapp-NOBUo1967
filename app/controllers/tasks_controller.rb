class TasksController < ApplicationController
  before_action :authenticate_user!

  def show
    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
  end

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build
  end
  
  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to board_path(@board), notice: 'Task was added successfully!'
    else
      flash.now[:error] = 'Failed to add the task'
      render :new
    end
  end

  def edit
    @board = current_user.boards.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task), notice: 'Update the task'
    else
      flash.now[:error] = 'Failed to update'
      render :edit
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    @task = board.tasks.find(params[:id])
    @task.destroy!
    redirect_to root_path, notice: 'Board has been successfully deleted.'
  end


  private
  def task_params
    params.require(:task).permit(:name, :description, :term, :eyecatch)
  end
end