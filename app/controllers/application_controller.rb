# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[nickname email encrypted_password password lastname firstname
                                               katakanalastname katakanafirstname birthday])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password, :password])
  end
end
