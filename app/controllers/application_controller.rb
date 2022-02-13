class ApplicationController < ActionController::Base
  prepend_before_action :set_current_user
  helper_method :current_user

  def current_user
    User.send(session[:current_user].to_sym)
  end

  private

  def set_current_user
    session[:current_user] ||= User.jack.name
  end
end
