class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    case resource
     when Admin
      admins_admin_top_path
     when Member
      items_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :member
      items_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    end
  end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
  end

end
