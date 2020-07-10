class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendee_events, foreign_key: :event_id
    has_many :attendees, class_name: "User", through: :attendee_events, source: :attendee

        scope :past, -> { where("eventdate < ?", Date.today) }
        scope :future, -> { where("eventdate > ?", Date.today) }
  
end
