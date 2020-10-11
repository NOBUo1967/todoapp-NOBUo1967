class BoardsController < ApplicationController
  def index
    @title = 'デイトラ'
  end

  def new
    @board = Board.new
  end
end