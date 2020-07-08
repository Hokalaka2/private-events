class CreateAttendeeEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :attendee_events do |t|
      t.references :event
      t.references :attendee
      t.timestamps
    end
  end
end
