class LessonsController < ApplicationController

  def index

  end

  def show

  end

  def new
    @lesson = Lesson.new
  end

  def create

  end

  def edit
    load_by_id
  end

end