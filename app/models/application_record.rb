class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def current_time
    Time.now.to_i
  end
end
