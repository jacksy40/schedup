class ChangeTableName < ActiveRecord::Migration
  def up
     rename_table :atendees, :attendees
  end
  def down
     rename_table :attendees, :atendees
  end
end
