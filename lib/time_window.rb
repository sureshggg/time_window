class TimeWindow
  def initialize(time_windows=[])
    @time_windows=[]
    time_windows.each do |tw|
      @time_windows << TimeWindowFactory.get(tw)
    end
  end

  def find_all(time)
    @time_windows.find_all do  |tw|
      tw.include? time
    end
  end
end
