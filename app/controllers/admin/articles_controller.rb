class Admin::ArticlesController < AdminController

	# http_basic_authenticate_with name: 'admin', password: 'admin', except: [:show]
	before_action :get_categories, only: [:show, :index]

	def new
		@article = Article.new
		@article.categories.build		
	end

	def create
		@article = Article.new(article_params_basic)

		create_update_categories

		if @article.save
			flash[:success] = "创建日志成功"
      redirect_to admin_articles_path
		else
			flash.now[:danger] = "创建日志失败"
      render "new"
		end
	end

	def index
		@articles_grid = initialize_grid(Article,
			include: [:categories],
			order: "created_at",
			order_direction: "desc"
			)
	end

	def edit
		@article = Article.find(params[:id])
		@article.categories.build if @article.categories.blank?
	end

	def update
		@article = Article.find(params[:id])
		
		create_update_categories

		if @article.update(article_params_basic)
			flash[:success] = "更新日志成功"
			redirect_to admin_articles_path
		else
			flash[:danger] = "更新日志失败"
			render 'edit'	
		end
	end

	def destroy
		@article = Article.find(params[:id])

    if @article.destroy
      flash[:success] = "日志删除成功"
    else
      flash[:danger] = "日志删除失败"
    end

    redirect_to admin_articles_path
	end

  def preview
		@text = params[:data]
		# logger.info("ssddd..." + @body)
		# render json: @body
	end

	private
	def article_params_basic
		params.require(:article).permit(:title, :text)
	end
	def article_params
		params.require(:article).permit(:title, :text, 														
																		 :categories_attributes => [:id, :name])
	end

	def get_categories
		@category = Category.all
	end

	def create_update_categories
		@article.categories.clear
		article_params["categories_attributes"].each_value do |category_arr|
			categories = category_arr["name"].strip.split(',')
			categories.each do |category|
				if @category = Category.find_by_name(category.strip)
					@article.categories << @category
				else
					@category = Category.create(name: category.strip)
					@article.categories << @category
				end
			end
		end
	end
end
