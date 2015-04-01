class Task < ActiveRecord::Base

 belongs_to :user
 has_many :availabilities

 validates :tasks, presence: true
 validates :date_cannot_be_in_the_past, presence: true
 validates :task_time, presence: true
 validates :location, presence: true,
 	length: { maximum: 500 }
 validates :user_id, presence: true

def date_cannot_be_in_the_past
    if task_date.present? && task_date < Date.today
      errors.add(:Date, "can't be in the past")
    end
  end
end
