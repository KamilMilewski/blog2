class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'asd', password: '123', only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      @post.comments.delete(@comment)
      render 'posts/show'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    
    if @comment.update(comment_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to post_path(params[:post_id])
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :content)
    end
end
