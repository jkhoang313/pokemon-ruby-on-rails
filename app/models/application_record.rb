class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def current_time
    Time.now.to_i
  end

  def time_format(time)
    hours_left = time / 3600
    seconds = time % 3600

    minutes_left = seconds / 60
    seconds_left = seconds % 60
    "#{hours_left} Hour(s) #{minutes_left} Minute(s) #{seconds_left} Second(s)"
  end
end
