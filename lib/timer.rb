class Timer
  def initialize
    @start_time = Time.new.to_i
  end

  def total_time
    @end_time = Time.new.to_i
    total_seconds = @end_time - @start_time
    return "#{total_seconds / 60} minutes and #{total_seconds % 60} seconds"
  end
end
