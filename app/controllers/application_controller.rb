  class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

# need to check if it the registration is complete

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_sign_in_path_for(resource)
    if current_user.role == nil
      request.env['omniauth.origin'] || stored_location_for(resource) || role_path(current_user)
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end

#def after_sign_in_path_for(resource)
#  edit_candidate_path(resource.candidate) if resource.role == 'candidate'
  #edit_company_path(resource.company) if resource.role == 'company'
#edit_candidate_path

end
