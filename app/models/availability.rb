class Availability < ActiveRecord::Base
	belongs_to :user
  belongs_to :task

	validates :avail_date, presence: true
	validates :avail_time, presence: true
	validates :user_id, presence: true
  validates_uniqueness_of :avail_time, scope: [:avail_date, :user_id]
end
