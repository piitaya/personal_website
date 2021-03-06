class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(:role)
  end

end