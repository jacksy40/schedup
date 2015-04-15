class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  has_many :attendees
  has_many :messages
  has_many :users, through: :attendees

  validates :task_id, presence: true
  validates :user_id, presence: true
  validates_uniqueness_of :task_id, scope: [:user_id]

end

