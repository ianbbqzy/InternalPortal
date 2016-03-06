class Event < ActiveRecord::Base
  has_many :user_events
  # has_and_belongs_to_many :users
  has_many :user_events
  has_many :users, through: :user_events
end
