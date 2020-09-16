class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  	private
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:is_deleted :first_name :first_name_kana :last_name :last_name_kana :postal_code :address :telephone_number :email])
  	end

  	def after_sign_in_path_for(resource)
  		items_index_path
  	end
  	
  	def after_sign_out_path_for(resource)
  		root_path
  	end
end
