class Timeslot < ActiveRecord::Base
  has_many :user_timeslots
  has_many :users, through: :user_timeslots
  has_many :schedule_timeslots
  has_many :schedules, through: :schedule_timeslots
  # has_and_belongs_to_many :users
  # has_many :users, :as => :tablers
  def to_label
    "#{time}"
  end
end
