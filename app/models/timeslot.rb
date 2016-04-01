class Timeslot < ActiveRecord::Base
  has_many :user_timeslots
  has_many :users, through: :user_timeslots
end
