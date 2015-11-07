class TimeWindowFactory
  def self.get(time_window)
    if time_window =~ /^(\w{3})-(\w{3})$/
      DayRangeWindow.new time_window
    elsif time_window =~ /^(\d{4})-(\d{4})$/
      TimeRangeWindow.new time_window 
    elsif time_window =~ /^(\w{3})-(\w{3}) (\d{4})-(\d{4})$/ 
      DayRangeTimeRangeWindow.new time_window 
    elsif time_window =~ /^(\w{3}) (\d{4})-(\d{4})$/
      DayRangeTimeRangeWindow.new "#{$1}-#{$1} #{$2}-#{$3}" 
    else
      raise "Not Implemented"
    end
  end
end
