class User < ApplicationRecord
  has_many :attendances
  has_many :attending_events, foreign_key: 'customer_id', class_name: "Event", through: :attendances
  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"
end