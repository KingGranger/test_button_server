class Event < ApplicationRecord
  belongs_to :arena
  belongs_to :event_type
  
  has_many :drawings
end
