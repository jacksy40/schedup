class Task < ActiveRecord::Base

 belongs_to :user
 has_many :availabilities

 validates :tasks, presence: true
 validates :task_date, presence: true
 validates :task_time, presence: true
 validates :location, presence: true,
 	length: { maximum: 500 }
 validates :user_id, presence: true
end

