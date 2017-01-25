class TypeWeakness < ApplicationRecord
  belongs_to :type
  belongs_to :weakness, class_name: "Type"
end
