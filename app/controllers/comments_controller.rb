class CommentsController < ApplicationController

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.' 
    else
      render action: 'posts#new'
      
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :content)
    end
end
