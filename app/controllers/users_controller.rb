class UsersController < ApplicationController

  def index
    #render text: User.find(params[:id]).to_yaml
    render text: (current_user || User.first).to_yaml
  end

  def show_session
    render text: "Session (<a href='/reset_session'>reset</a>):<br/>" << session.inspect
  end

end