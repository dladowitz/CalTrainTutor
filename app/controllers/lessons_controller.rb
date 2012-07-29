class LessonsController < ApplicationController

  def index
    lessons = Lesson.all.to_a.group_by {|l| l.northbound?}
    @northbound = lessons[true]
    @southbound = lessons[false]
  end

  def show
    load_by_id
  end

  def new
    @lesson = Lesson.new
  end

  def create
    date = params[:lesson].delete(:date)
    time = params[:lesson].delete(:time)
    if ( date && time )
      logger.warn "setting time #{Time.parse("#{date} #{time}")}"
      params[:lesson][:time] = Time.parse("#{date} #{time}")
    else
      logger.warn "not setting time #{date},  #{time}"
    end
    @lesson = Lesson.new(params[:lesson])
    @lesson.creator = current_user
    @lesson.save!
    redirect_to({action: :index}, :notice => 'lesson created')
  end

  def new_purchase
    load_by_id
    #@payment = @lesson.payment
  end

  def complete_purchase
    load_by_id
    current_user.purchase @lesson, params[:lesson]
    redirect_to lesson_path(@lesson)
  end

  def edit
    load_by_id
  end

end