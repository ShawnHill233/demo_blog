class AdministratorController < ActionController::Base
	protect_from_forgery with: :exception
	layout 'admin'
	include SessionsHelper

end
