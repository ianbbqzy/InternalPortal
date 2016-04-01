class Team < ActiveRecord::Base
  has_many :users
  has_many :requests, as: :requestable
end
