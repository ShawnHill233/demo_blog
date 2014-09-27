class Admin::CategoriesController < AdministratorController

	private
		def category_params
			params.require(:category).permit(:name)
		end
end
