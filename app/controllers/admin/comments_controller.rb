class CommentsController < AdministratorController

	http_basic_authenticate_with name: 'admin', password: 'admin', only: :destroy

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

end
