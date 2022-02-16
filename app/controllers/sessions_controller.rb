class SessionsController < ApplicationController
  def update
    session[:current_user] =
      (session[:current_user] == "jack") ? "jill" : "jack"
    redirect_to get_redirect_path
  end

  private

  def get_redirect_path
    case URI(request.referrer).path
    when /\/can_can_can\//
      can_can_can_posts_path
    when /\/pundit\//
      pundit_posts_path
    else
      posts_path
    end
  end
end
