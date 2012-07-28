class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :authenticate_user!

  private
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Mongoid::Errors::DocumentNotFound
      nil
    end
  end

  #def correct_user?
  #  @user = User.find(params[:id])
  #  unless current_user == @user
  #    redirect_to root_url, :alert => "Access denied."
  #  end
  #end

  def authenticate_user!
    unless current_user
      redirect_to root_url, :alert => 'You need to sign in for access to this page.'
    end
  end


end
