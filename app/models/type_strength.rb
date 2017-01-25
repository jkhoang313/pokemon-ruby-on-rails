class TypeStrength < ApplicationRecord
  belongs_to :type
  belongs_to :strength, class_name: "Type"
end
