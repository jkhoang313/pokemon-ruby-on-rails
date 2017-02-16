class Battle < ApplicationRecord
  belongs_to :challenger, class_name: "Trainer"
  belongs_to :challenged, class_name: "Trainer"
end
