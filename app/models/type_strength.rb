class TypeStrength < ApplicationRecord
  belongs_to :type, class_name: "Type"
  belongs_to :strength, class_name: "Type"
end
