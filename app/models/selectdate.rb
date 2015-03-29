class Selectdate < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :date, presence: true
  validates :user_id, presence: true
end

