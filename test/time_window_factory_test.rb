require 'minitest/autorun'
require_relative '../lib/time_window_factory.rb'
require_relative '../lib/day_range_window.rb'
require_relative '../lib/time_range_window.rb'
require_relative '../lib/day_range_time_range_window.rb'

class TimeWindowFactoryTest< Minitest::Test

  def test_factory
    assert TimeWindowFactory.get("Mon-Fri 0800-1700").is_a? DayRangeTimeRangeWindow
    assert TimeWindowFactory.get("Mon-Sat").is_a? DayRangeWindow
    assert TimeWindowFactory.get("Mon 0800-1700").is_a? DayRangeTimeRangeWindow
    assert TimeWindowFactory.get("0800-1700").is_a? TimeRangeWindow 
  end
end
