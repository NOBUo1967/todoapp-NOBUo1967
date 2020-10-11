class BoardsController < ApplicationController
  def index
    @title = 'デイトラ'
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board),notice: 'save it'
    else
      flash.now[:error] = 'failed to save it'
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end
end