class Schedule < ActiveRecord::Base
  serialize :assignment
  has_many :schedule_timeslots
  has_many :schedule_users
  has_many :timeslots, through: :schedule_timeslots
  has_many :users, through: :schedule_users
end
