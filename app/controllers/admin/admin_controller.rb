class Admin::AdminController < AdministratorController
  
  def index
  	if !signed_in?
		flash[:danger] = "需要登录授权才能访问"
    redirect_to admin_signin_path
	end
  end
end
