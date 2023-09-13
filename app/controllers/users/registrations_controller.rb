# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  Devise::RegistrationsController
  respond_to :json
  def create
    build_resource(sign_up_params)
    resource.save
    sign_in(resource_name, resource)
    render json: resource
  end
  
  before_action :configure_sign_up_params, only: [:create]
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
