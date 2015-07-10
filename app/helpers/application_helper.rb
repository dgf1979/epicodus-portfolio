module ApplicationHelper
  def human_date(artime)
    t = artime.to_time
    return t.localtime.strftime("%b. %d")
  end

  def human_time(artime)
    t = artime.to_time
    return t.localtime.strftime("%I:%M %p")
  end
end
