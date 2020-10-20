class TasksController < ApplicationController
  before_action :authenticate_user!

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end
end