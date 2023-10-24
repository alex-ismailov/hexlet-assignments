class Web::Movies::CommentsController < Web::Movies::ApplicationController
  def index
    @comments = resource_movie.comments.order(id: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = resource_movie.comments.build(comments_params)
    if @comment.save
      redirect_to movie_comments_path(resource_movie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comments_params)
      redirect_to movie_comments_path(resource_movie)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to movie_comments_path(resource_movie)
    else
      redirect_to movie_comments_path(resource_movie), status: :unprocessable_entity
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :movie_id)
  end
end
