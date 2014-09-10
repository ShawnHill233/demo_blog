class ArticlesController < ApplicationController

	http_basic_authenticate_with name: 'admin', password: 'admin', except: [:index, :show]
	before_action :get_categories, except: [:update, :destroy]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def index
		# @article = Article.all 
		@article = Article.includes(:categories).search(params[:keyword]).filter(params[:filter])
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'	
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

		def get_categories
			@category = Category.all
		end
end
