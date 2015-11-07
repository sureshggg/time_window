require 'minitest/autorun'
require_relative '../lib/time_range_window.rb'

class TimeRangeWindowTest < Minitest::Test
  def test_time_range
    time_range_window = TimeRangeWindow.new("0012-0433")

    assert_equal true, time_range_window.include?(c "0040")
    assert_equal true, time_range_window.include?(c "0340")
    assert_equal false, time_range_window.include?(c "0010")
    assert_equal false, time_range_window.include?(c "0434")
    assert_equal false, time_range_window.include?(c "0514")
  end

  def test_overlapping_range
    time_range_window = TimeRangeWindow.new("0512-0433")

    assert_equal true, time_range_window.include?(c "0640")
    assert_equal true, time_range_window.include?(c "0340")
    assert_equal false, time_range_window.include?(c "0434")
    assert_equal false, time_range_window.include?(c "0511")
  end

  def test_overlapping_same_hour
    time_range_window = TimeRangeWindow.new("0552-0503")

    assert_equal true, time_range_window.include?(c "0552")
    assert_equal true, time_range_window.include?(c "0503")
    assert_equal false, time_range_window.include?(c "0434")
    assert_equal false, time_range_window.include?(c "0511")
    assert_equal true, time_range_window.include?(c "0500")
  end

  def test_same_hour_same_range
    time_range_window = TimeRangeWindow.new("0502-0502")

    assert_equal true, time_range_window.include?(c "0502")
    assert_equal false, time_range_window.include?(c "0512")
    assert_equal false, time_range_window.include?(c "0602")
    assert_equal false, time_range_window.include?(c "1002")
  end

  def test_to_s
    time_range_window = TimeRangeWindow.new("0502-0502")
    assert_equal "0502-0502", time_range_window.to_s
  end

  private

  def create_time(time)
    time =~ /(\d\d)(\d\d)/
    "2015/11/04 #{$1}:#{$2}:00"
  end

  alias_method :c, :create_time
end
