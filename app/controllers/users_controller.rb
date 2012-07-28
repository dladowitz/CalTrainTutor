class UsersController < ApplicationController


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