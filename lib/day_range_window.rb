require 'time'

class DayRangeWindow
  DAY_RANGE = ["Sun", "Mon", "Tue" ,"Wed", "Thu", "Fri", "Sat"]

  def initialize(range)
    @range=range
    @start_day, @end_day = @range.split("-")
    @start_day_index = DAY_RANGE.index(@start_day.capitalize)
    @end_day_index = DAY_RANGE.index(@end_day.capitalize)
  end

  def include?(time)
    time = time.is_a?(String) ? Time.parse(time) : time 
    day_index = DAY_RANGE.index(time.strftime("%a"))

    if @start_day_index > @end_day_index
      (@start_day_index..DAY_RANGE.length-1).include?(day_index) ||
        (0..@end_day_index).include?(day_index) 
    else
      (@start_day_index..@end_day_index).include?(day_index) 
    end
  end
  
  def to_s
    @range
  end

end
