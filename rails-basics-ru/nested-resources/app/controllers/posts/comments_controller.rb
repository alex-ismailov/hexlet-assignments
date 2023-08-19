module Posts
  class CommentsController < ApplicationController
    before_action :set_comment, only: %i[show edit update destroy]
    before_action :set_post, only: %i[index new create]

    def index
    end
  
    def new
      @comment = @post.post_comments.build
    end
  
    def create
      @comment = @post.post_comments.build(comment_params)

      if @comment.save
        redirect_to post_path(@post), notice: 'Comment was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      # debugger
      if @comment.update(comment_params)
        # debugger
        redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end

    end
  
    def destroy
      @comment.destroy

      redirect_to post_path(@comment.post)
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = PostComment.find(params[:id])
    end

    def comment_params
      params.required(:post_comment).permit(:body, :post_id)
    end
  end
end
