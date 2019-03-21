class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      @user = current_user
      redirect_to user_path(@user)
    else
      @service_provider = current_service_provider
      redirect_to service_provider_path(@service_provider)
    end
  end

end
