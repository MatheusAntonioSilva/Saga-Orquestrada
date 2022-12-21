class ApplicationController < ::ActionController::API

  rescue_from ::StandardError, with: :internal_server_error!
  rescue_from ::Exceptions::Base, with: :error!
  rescue_from ::ActiveRecord::RecordNotFound, with: :not_found!
  rescue_from ::ActiveRecord::RecordInvalid, with: :unprocessable_entity!

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kind])
  end

  def internal_server_error!(error)
    render json: error, status: :internal_server_error, serializer: ::ErrorSerializer::Base
  end

  def error!(error)
    render json: error, status: error.code, serializer: ::ErrorSerializer::Base
  end

  def not_found!(error)
    render json: error, status: :not_found, serializer: ::ErrorSerializer::Base
  end

  def unprocessable_entity!(error)
    render json: error, status: :unprocessable_entity, serializer: ::ErrorSerializer::Base
  end
end
