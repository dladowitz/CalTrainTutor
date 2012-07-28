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


  # reads params[:id] and finds a resource
  # by default uses the class associate w/ the current controller
  # can be passed a symbol class name as well, such as :user
  # sets an instance variable after the model name, such as @user
  # returns the found resource
  def load_by_id(name = nil)
    load_by(:id, name)
  end

  def load_by(key, symbol = nil)
    name = symbol ? symbol.to_s.classify : controller_name.classify
    klass = name.constantize

    raise "unknown class: #{klass}" unless klass

    # handle friendly URLs across the board
    id = params[key]

    if id == 'new'
      resource = klass.new
    else
      # todo: detect and handle IDs like "c-0"
      resource = klass.find(id)
    end

    if resource
      name = ('@' << name.underscore).to_sym
      instance_variable_set(name, resource)
      return resource
    else
      raise ApplicationController::ResourceNotFound, "#{klass} #{id} doesn't exist!"
    end
  end

end
