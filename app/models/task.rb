class Task < ActiveRecord::Base

 has_many :events
 belongs_to :user
 has_many :availabilities

 validates :tasks, presence: true
 validates :date_cannot_be_in_the_past, presence: true
 validates :task_time, presence: true
 validates :location, presence: true,
 	length: { maximum: 500 }
 validates :user_id, presence: true
 validates_uniqueness_of :task_time, scope: [:task_date, :user_id]

  def date_cannot_be_in_the_past
    if task_date.present?
    date = Date.parse task_date.to_s
    yesterday = (Date.today - 1)
    end
    if task_date.present? && date <= yesterday
      errors.add(:Date, "can't be in the past")
    else
      true
    end
  end
end
