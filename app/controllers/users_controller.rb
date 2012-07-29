class UsersController < ApplicationController


  def show_session
    render text: "Session (<a href='/reset_session'>reset</a>):<br/>" << session.inspect
  end

  def show
    load_by_id
  end

  def whoami
    if current_user
      render json: {user: current_user.inspect.gsub(/"/, "'")}
    else
      render text: 'logged out'

    end
  end

  def me
    @user = current_user
    @lessons_offered = @user.lessons_offered
    @lessons_taking = @user.lessons_received
    render :show
  end

  def info

  end

end