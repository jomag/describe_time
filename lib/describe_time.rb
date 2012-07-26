module DescribeTime
  def self.describe_time(the_time = Time.now, current_time = Time.now)
    if current_time - the_time < 0
      puts "Time in the future"
    else
      if current_time - the_time < 5
        puts "Seconds ago"
      else
        puts the_time
      end
    end
  end
end

class Time
  def describe
    DescribeTime.describe_time(self, Time.now)
    puts "no chance"
  end
end
