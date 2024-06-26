class API::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up successfully.', user: current_user.as_json },
           status: :ok
  end

  def register_failed
    render json: { message: 'Unable to create account. Check your details and try again.' },
           status: :unprocessable_entity
  end
end
