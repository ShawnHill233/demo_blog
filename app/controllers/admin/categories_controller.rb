class Admin::CategoriesController < AdministratorController

	def index
		@categories_grid = initialize_grid(Category,
			order: "created_at",
			order_direction: "desc"
			)
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])

		if @category.update(category_params)
			flash[:success] = "更新日志成功"
			redirect_to admin_categories_path
		else
			flash[:danger] = "更新日志失败"
			render 'edit'	
		end
	end


	def destroy
		@category = Category.find(params[:id])

    if @category.destroy
      flash[:success] = "类目删除成功"
    else
      flash[:danger] = "类目删除失败"
    end

    redirect_to admin_categories_path
	end

	private
		def category_params
			params.require(:category).permit(:name)
		end
end
