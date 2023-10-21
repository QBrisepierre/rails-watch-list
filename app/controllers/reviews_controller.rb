class ReviewsController < ApplicationController
  def create
    @review = Review.new(set_params)
    @review.list_id = params[:list_id]
    if @review.save
      redirect_to list_path(@review.list_id)
    else
      @bookmark = Bookmark.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:review).permit(:comment, :rating, :list_id)
  end
end
