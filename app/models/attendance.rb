class Attendance < ApplicationRecord #précense, participation
  belongs_to :event
  belongs_to :customer, class_name: 'User'
end
