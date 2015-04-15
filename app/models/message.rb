class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :event

  validates :attendee_id, null: false
  validates :event_id, null: false
end
