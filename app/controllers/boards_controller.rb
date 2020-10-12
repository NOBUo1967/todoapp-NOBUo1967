class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to board_path(@board), notice: 'save it'
    else
      flash.now[:error] = 'failed to save it'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: 'update the board'
    else
      flash.now[:error] = 'failed to update'
      render :edit
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end
end