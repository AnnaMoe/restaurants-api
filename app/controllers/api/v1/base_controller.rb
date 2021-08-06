class Api::V1::BaseController < ActionController::API
  # want to protect all our controllers in the api thank to pundit
  include Pundit
  # check taht pundit was used:
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  # if we have an error, e.g. 500, we want to render json instead of html
  rescue_from Pundit::NotAuthorizedError,   with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def user_not_authorized(exception)
    render json: {
      error: "Unauthorized #{exception.policy.class.to_s.underscore.camelize}.#{exception.query}"
    }, status: :unauthorized
  end

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end
end