class Api::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:create]
  skip_before_action :verify_authenticity_token	
  def create
    build_resource(sign_up_params)
    resource.save
    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        render json: "You signed up successful"
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        render json: {message: :"signed_up_but_#{resource.inactive_message}"}
      end
    else
      render json: resource.errors.full_messages
    end
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
end
