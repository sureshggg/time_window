require  'minitest/autorun'
require_relative '../lib/day_range_window.rb'
require_relative '../lib/time_range_window.rb'
require_relative '../lib/time_window_factory.rb'
require_relative '../lib/time_window.rb'

class TimeWindowTest < Minitest::Test
  def test_time_window
    tw= TimeWindow.new([
   "Mon 1800-2000",
   "Sat-Sun",
   "Mon-Fri 0800-1700",
   "0800-1700",
   "Mon-Sun 0600-0700",
   "Fri-Sat 1900-2200"
    ])

    windows= tw.find_all("2015-06-29 11:58:47").collect{|w| w.to_s}
    assert_equal ["Mon-Fri 0800-1700", "0800-1700"], windows
    windows= tw.find_all("2015-06-27 06:20:07").collect{|w| w.to_s}
    assert_equal ["Sat-Sun", "Mon-Sun 0600-0700"], windows
    windows= tw.find_all("2015-05-07 20:10:40").collect{|w| w.to_s}
    assert_equal [], windows
  end
end

