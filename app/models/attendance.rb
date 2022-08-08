class Attendance < ApplicationRecord #précense, participation
  before_create :new_customer_mail
  belongs_to :event
  belongs_to :customer, class_name: 'User'

  def new_customer_mail
    UserMailer.attendances_email(find_admin).deliver_now
  end

  def find_admin
    self.event.admin
  end
end
