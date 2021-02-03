class Relationship < ApplicationRecord
  belongs_to :followa, class_name: "User"
  belongs_to :follow, class_name: "User"
end
