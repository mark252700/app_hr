class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def create
    super do |resource|
      if resource.persisted?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        if resource.admin?
          redirect_to admin_index_path
          flash[:notice] = "Successfully added as an admin."
        else
          sign_in(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        end
      end
    end
  end

  # Override the after_sign_up_path_for method
  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  # ...

  private

 def configure_sign_up_params
  params.require(:user).permit(:email, :password, :password_confirmation, :role)
end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :role])
  end
end
