class ApplicationController < ActionController::Base
  before_action :set_devise_mapping

  def set_devise_mapping
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
      end

      def after_sign_in_path_for(resource)
        if resource.admin?
          admin_index_path
        else
          root_path # Modify this to the default path for non-admin users
        end
      end
end
