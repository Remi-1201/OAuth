class ApplicationController < ActionController::Base
  
  # deviseのストロングパラメータ設定
  protected
  def configure_permitted_parameters
    # sign_up時に[:name]の値を許す設定
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
