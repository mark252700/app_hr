# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

 def create
    super do |user|
      if user.approved?
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        # User is not approved, set a flag or session variable
        flash[:alert] = "Your account is pending approval."
      end
    end
  end

 
end
