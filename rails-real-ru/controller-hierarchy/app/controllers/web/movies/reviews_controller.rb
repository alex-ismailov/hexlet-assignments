class Web::Movies::ReviewsController < Web::Movies::ApplicationController
  def index
    @reviews = resource_movie.reviews.order(id: :desc)
  end

  def new
    @review = Review.new
  end

  def create
    @review = resource_movie.reviews.build(review_params)
    if @review.save
      redirect_to movie_reviews_path(resource_movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_path(resource_movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to movie_reviews_path(resource_movie)
    else
      redirect_to movie_reviews_path(resource_movie), status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
