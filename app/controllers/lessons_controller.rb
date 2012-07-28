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
    @lesson = Lesson.create(params[:lesson])
    redirect_to({action: :index}, :notice => 'lesson created')
  end

  def edit
    load_by_id
  end

end