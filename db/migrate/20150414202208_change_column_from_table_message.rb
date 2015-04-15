class ChangeColumnFromTableMessage < ActiveRecord::Migration
  def up
    rename_column :messages, :attendee_id, :user_id
  end

  def down
     rename_column :messages, :user_id, :attendee_id
  end
end
