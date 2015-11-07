require_relative "../lib/day_range_window.rb"
require_relative "../lib/time_range_window.rb"
require_relative "../lib/day_range_time_range_window.rb"
require_relative "../lib/time_window_factory.rb"
require_relative "../lib/time_window.rb"

time_windows=[]
test_inputs=[]

=begin
time_windows =[
   "Mon 1800-2000",
   "Sat-Sun",
   "Mon-Fri 0800-1700",
   "0800-1700",
   "Mon-Sun 0600-0700",
   "Fri-Sat 1900-2200"
]

test_inputs = [
"2015-06-29 11:58:47",
"2015-06-27 06:20:07",
"2015-05-07 20:10:40"
]
=end


=begin
*Output

2015-06-29 11:58:47 - ["Mon-Fri 0800-1700", "0800-1700"]
2015-06-27 06:20:07 - ["Sat-Sun", "Mon-Sun 0600-0700"]
2015-05-07 20:10:40 - []

=end

File.open("inputs/input_time_windows.txt", "r") do |f|
  while line=f.gets
    time_windows << line.strip
  end
end

File.open("inputs/input_times.txt", "r") do |f|
  while line=f.gets
    test_inputs << line.strip
  end
end

tw=TimeWindow.new(time_windows)

test_inputs.each do |input|
  puts "#{input} - #{tw.find_all(input).collect{|w| w.to_s}.inspect}"
end
