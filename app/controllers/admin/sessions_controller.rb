class Admin::SessionsController < AdministratorController

	def new
	
	end
	def create
		
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to admin_root_path
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end
	def destroy
		
	end
end