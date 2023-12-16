class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      register_success
    else
      register_failed
    end
  end

  def register_success
    render json: { message: 'Signed up.',  current_user: resource}
  end

  def register_failed
    render json: { message: "Signed up failure.  #{resource.errors.full_messages.to_sentence}" }
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end