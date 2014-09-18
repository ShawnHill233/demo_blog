class ArticlesController < ApplicationController

	http_basic_authenticate_with name: 'admin', password: 'admin', except: [:index, :show]
	before_action :get_categories, except: [:update, :destroy]

	def index
		# @article = Article.all 
		@article = Article.includes(:categories).search(params[:keyword]).filter(params[:filter])
	end

	def show
		@article = Article.find(params[:id])
	end

	private
		def get_categories
			@category = Category.all
		end
end
