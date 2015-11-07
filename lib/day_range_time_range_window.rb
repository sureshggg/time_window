class DayRangeTimeRangeWindow
  def initialize(range)
    @range = range
    @range =~/(\w+)-(\w+) (\d+)-(\d+)/
    @day_range = DayRangeWindow.new("#{$1}-#{$2}")
    @time_range = TimeRangeWindow.new("#{$3}-#{$4}")
  end

  def include? time
    @day_range.include?(time) &&
      @time_range.include?(time)
  end

  def to_s
    @range
  end
end
