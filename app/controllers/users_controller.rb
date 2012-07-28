class UsersController < ApplicationController

  def index
    render text: (current_user || User.first).to_yaml
  end

  def show_session
    render text: "Session (<a href='/reset_session'>reset</a>):<br/>" << session.inspect
  end

  def show
    load_by_id
  end

  def me
    @user = current_user
    render :show
  end

end