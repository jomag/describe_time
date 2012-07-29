module DescribeTime
  def self.time_or_date(tm = Time.now, now = Time.now, time_fmt = '%H:%M', date_fmt = '%Y-%m-%d')
    if tm.year == now.year && tm.yday == now.yday then
      tm.strftime(time_fmt)
    else
      tm.strftime(date_fmt)
    end
  end

  def self.approximate(the_time = Time.now, current_time = Time.now)
    ts = current_time - the_time

    if ts < 0
      "time in the future"
    elsif ts < 5        # <- Five seconds
      "a few seconds ago"
    elsif ts < 60       # <- One minute
      "less than a minute ago"
    elsif ts < 180      # <- Three minutes
      "a few minutes ago"
    elsif ts < 60 * 60  # <- One hour
      "%d minutes ago" % (ts / 60).to_i
    elsif ts < 2*60*60  # <- Two hours
      "one hour and %d minutes ago" % ((ts - 60*60) / 60).to_i
    elsif ts < 48*60*60 # <- Two days (48 hours)
      "%d hours ago" % (ts / 60*60).to_i
    elsif ts < 2*7*24*60*60 # <- Two weeks (14 days)
      "%d days ago" % (ts / 24*60*60).to_i
    else
      "%d weeks ago" % (ts / 7*24*60*60).to_i
    end
  end
end

class Time
  def describe(fmt)
    case fmt
    when :time_or_date
      DescribeTime.time_or_date(self)
    when :approximate
      DescribeTime.approximate(self)
    else
      DescribeTime.strftime('%Y-%m-%d %H:%M')
    end
  end
end
