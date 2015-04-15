class Attendee < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :messages

  validates :event_id, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :event_id, scope: [:user_id]
end

