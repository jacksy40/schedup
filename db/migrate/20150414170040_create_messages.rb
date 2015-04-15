class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :attendee_id, null: false
      t.integer :event_id, null: false

      t.timestamps null: false
    end
  end
end
