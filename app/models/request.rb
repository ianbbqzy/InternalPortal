class Request < ActiveRecord::Base
  belongs_to :requestable, polymorphic: true
  belongs_to :event
end
