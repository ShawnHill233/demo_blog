class ArticlesController < ApplicationController

	# http_basic_authenticate_with name: 'admin', password: 'admin', except: [:index, :show]
	before_action :get_categories, except: [:update, :destroy]

	def index
		# @article = Article.all 
		@article = Article.order(created_at: :desc)
											.search(params[:keyword])
											.filter_category(params[:filter_category])
											.filter_archive(params[:filter_archive])
											.paginate(page: params[:page], per_page: 8)
											
	end

	def show
		@article = Article.find(params[:id])
	end

	private
		def get_categories
			@category = Category.all
		end
end
