# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def create
    self.resource = warden.authenticate!(auth_options)

    if resource.approved? && !resource.archive
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      # User is not approved or is archived, set a flag or session variable
      if resource.archive
        flash[:alert] = "Your account has been archived and cannot be used for login."
      else
        flash[:alert] = "Your account is pending approval."
      end
      sign_out(resource_name)
      respond_with resource, location: new_user_session_path
    end
  end
end
