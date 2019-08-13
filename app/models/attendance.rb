class Attendance < ApplicationRecord
  after_create :new_attendee_send
  
  belongs_to :user
  belongs_to :event

  def new_attendee_send
    AttendanceMailer.new_attendee_email(self).deliver_now
  end
end
