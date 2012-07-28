class UsersController < ApplicationController


  def show_session
    render text: "Session (<a href='/reset_session'>reset</a>):<br/>" << session.inspect
  end

  def show
    load_by_id
  end

  def me
    @user = current_user
    @lessons_offered = @user.lessons_offered
    @lessons_taking = @user.lessons_received
    render :show
  end

end