class PostsController < ApplicationController
	http_basic_authenticate_with name: 'asd', password: '123', 
								 only: [:destroy, :edit]

	def index
		@posts = Post.all
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render new_post_path
		end
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :content)
		end
end
