Find out the time windows, the current time or any given time fall within.
 
The defined time windows are:
  # Mon 1800-2000
  # Sat-Sun          
  # Mon-Fri 0800-1700
  # Mon-Sun 0600-0700
  # Fri-Sat 1900-2200
 
  Examples :-
  Time                      Time Windows
  2015-06-29 11:58:47  - ["Mon-Fri 0800-1700", "0800-1700"]
  2015-06-27 06:20:07  - ["Sat-Sun", "Mon-Sun 0600-0700"]
  2015-05-07 20:10:40  - []

Inputs:
inputs/input_time_windows.txt - Each line has the  input time windows
Mon 1800-2000
Sat-Sun          
Mon-Fri 0800-1700
Mon-Sun 0600-0700
Fri-Sat 1900-2200

inputs/input_times.txt - Each line in this file is matched against the time windows
2015-06-29 11:58:47
2015-06-27 06:20:07
2015-05-07 20:10:40

Run the following file to execute.
ruby bin/time_window.rb 
