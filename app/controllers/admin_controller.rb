class AdminController < ActionController::Base
	# protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
	
	layout 'admin'
	include SessionsHelper

end
