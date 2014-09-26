class Admin::ArticlesController < AdministratorController

	http_basic_authenticate_with name: 'admin', password: 'admin', except: [:show]
	before_action :get_categories, except: [:update, :destroy]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

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

    if @article.destroy
      flash[:success] = "日志删除成功"
    else
      flash[:danger] = "日志删除失败"
    end

    redirect_to admin_articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end

	def get_categories
		@category = Category.all
	end
end
