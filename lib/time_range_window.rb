require 'time'

class TimeRangeWindow
  HOUR_RANGE_MAX=29
  MIN_RANGE_MAX=59

  def initialize(range)
    @range = range
    @start_time , @end_time = range.split("-")

    @start_time =~ /(\d\d)(\d\d)/
    @start_time_hour = $1.to_i
    @start_time_min = $2.to_i 

    @end_time =~ /(\d\d)(\d\d)/
    @end_time_hour = $1.to_i
    @end_time_min = $2.to_i
  end

  def include?(time)
    time = time.is_a?(String) ? Time.parse(time) :  time
    hour= time.strftime("%k").to_i
    min= time.strftime("%M").to_i

    if @start_time_hour  == @end_time_hour
       if hour == @start_time_hour
         return min_include?(min)
       else
         return false
       end
    end

    if @start_time_hour == hour
        return min >= @start_time_min
    end

    if @end_time_hour == hour
      return min <= @end_time_min 
    end

    return hour_include? hour

  end

  def to_s
    @range
  end

  private

  def min_include?(min)
    if @start_time_min > @end_time_min
      (@start_time_min..MIN_RANGE_MAX).include?(min) ||
        (0..@end_time_min).include?(min)
    else
      (@start_time_min..@end_time_min).include? min
    end
  end

  def hour_include?(hour)
    if @start_time_hour > @end_time_hour
      (@start_time_hour..HOUR_RANGE_MAX).include?(hour) ||
        (0..@end_time_hour).include?(hour)
    else
      (@start_time_hour..@end_time_hour).include? hour
    end
  end

end
