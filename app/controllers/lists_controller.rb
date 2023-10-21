class ListsController < ApplicationController
  before_action :set_params, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @bookmarks = @list.bookmarks
    @reviews = @list.reviews
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params[:review] ? @list = List.find(params[:list_id]) : @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
