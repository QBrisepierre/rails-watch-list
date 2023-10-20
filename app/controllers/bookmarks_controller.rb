class BookmarksController < ApplicationController
  before_action :set_params, only: [:destroy]

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @collection = []
    @list = List.find(params[:list_id])
    id = []
    @list.bookmarks.each do |bookmark|
      id << bookmark.movie_id
    end

    @movies = @movies.reject do |movie|
      @collection << [movie.title, movie.id] if id.include?(movie.id) == false
    end
    
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params[:list_id]
    if @bookmark.save
      redirect_to list_path(@bookmark.list_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    raise
    @bookmark.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_params
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment, :list_id)
  end
end
