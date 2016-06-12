# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make Teams

User.create first_name: 'Ian', last_name: 'Lee', team_id: 1, year: 'Freshman', major: 'Computer Science', email: 'ian.lee@berkeley.edu', password: '12345678', password_confirmation: '12345678'


User.create first_name: 'Mandy', last_name: 'Huang', team_id: 1, year: 'Senior', major: 'Computer Science', email: 'mandy.huang@berkeley.edu', password: '12345678', password_confirmation: '12345678'
User.create first_name: 'Joyce', last_name: 'Wong', team_id: 1, year: 'Senior', major: 'Sociology', email: 'joyce.wong@berkeley.edu', password: '12345678', password_confirmation: '12345678'
User.create first_name: 'Nga Pui', last_name: 'Leung', team_id: 1, year: 'Sophomore', major: 'Statistics', email: 'ngapui.leung@berkeley.edu', password: '12345678', password_confirmation: '12345678'
User.create first_name: 'Michelle', last_name: 'Lau', team_id: 2, year: 'Senior', major: 'Sociology', email: 'michelle.lau@berkeley.edu', password: '12345678', password_confirmation: '12345678'
User.create first_name: 'Adrian', last_name: 'Wu', team_id: 2, year: 'Senior', major: 'Economics', email: 'adrian.wu@berkeley.edu', password: '12345678', password_confirmation: '12345678'
User.create first_name: 'Ka Kit', last_name: 'Mak', team_id: 3, year: 'Graduated', major: 'Industrial Engineering', email: 'kakit.mak@berkeley.edu', password: '12345678', password_confirmation: '12345678'
User.create first_name: 'Lydia', last_name: 'Ho', team_id: 3, year: 'Sophomore', major: 'Alcohol', email: 'lydia.ho@berkeley.edu', password: '12345678', password_confirmation: '12345678'


Team.create name: 'Operations'
Team.create name: 'Marketing'
Team.create name: 'EventDevelopment'

users = User.all
t = Timeslot.create time: '10am-11am'
8.times do |f|
  t.user_timeslots.create(
    user: users[f]
  )
end
t = Timeslot.create time: '11am-12pm'
8.times do |f|
  t.user_timeslots.create(
    user: users[f]
  )
end
t = Timeslot.create time: '12pm-1pm'
4.times do |f|
  t.user_timeslots.create(
    user: users[f]
  )
end
t = Timeslot.create time: '1pm-2pm'
4.times do |f|
  t.user_timeslots.create(
    user: users[f+4]
  )
end
