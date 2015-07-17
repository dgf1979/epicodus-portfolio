module ApplicationHelper
  def human_date(artime)
    t = artime.to_time
    return apply_client_timezone(t).strftime("%b. %d")
  end

  def human_time(artime)
    t = artime.to_time
    return apply_client_timezone(t).strftime("%I:%M %p")
  end

  private
    def apply_client_timezone(rbtime)
      tz = session[:user_tz]
      return rbtime.in_time_zone(tz)
    end
end
