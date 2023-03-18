class Api::SessionsController < Devise::SessionsController
  prepend_before_action :require_no_authentication, only: [:create]
  skip_before_action :verify_authenticity_token
  def create
  	self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render json: "Welcome #{current_user.name}"
  end
  def failure
    render json: {message: "Invalid Email/Password"}
  end  
  private

  def require_no_authentication
    assert_is_devise_resource!
    return unless is_navigational_format?
    no_input = devise_mapping.no_input_strategies

    authenticated = if no_input.present?
      args = no_input.dup.push scope: resource_name
      warden.authenticate?(*args)
    else
      warden.authenticated?(resource_name)
    end

    if authenticated && resource = warden.user(resource_name)
      render json: {message: 'You are already signed in.'}
    end
  end
  protected

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#failure" }
  end	
end
