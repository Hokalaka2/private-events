class User < ApplicationRecord
   has_many :events, foreign_key: :creator_id
   has_many :attendee_events, foreign_key: :attendee_id
   has_many :attended, class_name: "Event", through: :attendee_events, source: :event
   
end
