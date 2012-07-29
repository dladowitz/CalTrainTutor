module ApplicationHelper
  def eta(date)
    if date.day == Time.now.day
      'Today'
    elsif  date.day == 1.day.from_now.day
      'Tomorrow'
    else
      date.to_s(:month_day2)
    end
  end

end
