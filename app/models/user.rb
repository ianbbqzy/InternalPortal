class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :team
  # has_and_belongs_to_many :events
  has_many :user_events
  has_many :events, through: :user_events
  has_many :user_timeslots
  has_many :timeslots, through: :user_timeslots
  # has_and_belongs_to_many :timeslots
  has_many :requests, as: :requestable
  has_many :schedule_users
  has_many :schedules, through: :schedule_users
  def to_label
    "#{first_name} #{last_name}"
  end
end
