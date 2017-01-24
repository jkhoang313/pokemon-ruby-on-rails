class TypeWeakness < ApplicationRecord
  belongs_to :type, class_name: "Type"
  belongs_to :weakness, class_name: "Type"
end
