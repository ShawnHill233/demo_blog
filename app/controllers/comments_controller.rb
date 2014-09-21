class CommentsController < ApplicationController

	http_basic_authenticate_with name: 'admin', password: 'admin', only: :destroy
	
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)
		if @comment.save
			flash[:success] = "successful."
		else
			flash[:danger] = "faild."
		end
		redirect_to article_path(@article)

	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
