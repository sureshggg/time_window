require  'minitest/autorun'
require_relative '../lib/day_range_time_range_window.rb'
require_relative '../lib/day_range_window.rb'
require_relative '../lib/time_range_window.rb'

class DayRangeTimeRangeWindowTest < Minitest::Test
  def test_ranges
    day_range_time_range = DayRangeTimeRangeWindow.new("Mon-Tue 0800-1700")
    assert_equal true, day_range_time_range.include?("2015/11/09 09:00:00")
    assert_equal true, day_range_time_range.include?("2015/11/10 09:00:00")

    assert_equal false, day_range_time_range.include?("2015/11/08 09:00:00")
    assert_equal false, day_range_time_range.include?("2015/11/10 07:00:00")
  end

  def test_to_s
    day_range_time_range = DayRangeTimeRangeWindow.new("Mon-Tue 0800-1700")
    assert_equal "Mon-Tue 0800-1700", day_range_time_range.to_s
  end
end
