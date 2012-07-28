class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all.to_a
  end

  def show
    load_by_id
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.creator = current_user
    @lesson.save!
    redirect_to({action: :index}, :notice => 'lesson created')
  end

  def buy
    load_by_id
    # todo: not buy own
    current_user.purchase @lesson
  end

  def edit
    load_by_id
  end

end