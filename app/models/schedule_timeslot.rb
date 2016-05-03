class ScheduleTimeslot < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :timeslot
end
