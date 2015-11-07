require 'minitest/autorun'
require_relative '../lib/day_range_window.rb'

class DayRangeWindowTest < Minitest::Test
  def test_day_range
    day_range_window = DayRangeWindow.new("Sat-Sun")
    assert_equal true, day_range_window.include?("2015/11/07 00:00:00")
    assert_equal true, day_range_window.include?("2015/11/08 00:00:00")

    assert_equal false, day_range_window.include?("2015/11/06 00:00:00")
    assert_equal false, day_range_window.include?("2015/11/09 00:00:00")

  end
  
  def test_day_range_overlapping
    day_range_window = DayRangeWindow.new("Wed-Mon")
    assert_equal true, day_range_window.include?("2015/11/04 00:00:00")
    assert_equal true, day_range_window.include?("2015/11/07 00:00:00")
    assert_equal true, day_range_window.include?("2015/11/08 00:00:00")
    assert_equal true, day_range_window.include?("2015/11/09 00:00:00")
    assert_equal false, day_range_window.include?("2015/11/10 00:00:00")
  end

  def test_day_range_same_day
    day_range_window = DayRangeWindow.new("Wed-Wed")

    assert_equal true, day_range_window.include?("2015/11/04 00:00:00")

    assert_equal false, day_range_window.include?("2015/11/05 00:00:00")
    assert_equal false, day_range_window.include?("2015/11/06 00:00:00")
  end

  def test_to_s
    day_range_window = DayRangeWindow.new("Wed-Wed")
    assert_equal "Wed-Wed" , day_range_window.to_s
  end

end
