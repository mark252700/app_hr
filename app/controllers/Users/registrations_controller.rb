class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # POST /resource
  def create
    puts "Received params: #{params.inspect}"
    super do |resource|
      if resource.persisted?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        if resource.admin?
          redirect_to admin_index_path
        else
          sign_in(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        end
      end
    end
  end

  # ...

  private

 def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :role])
  params.require(:user).permit(:email, :password, :password_confirmation, :role)
end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :role])
  end
end
