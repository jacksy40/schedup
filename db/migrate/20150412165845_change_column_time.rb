class ChangeColumnTime < ActiveRecord::Migration
  def up
    change_column :availabilities, :avail_time, 'time USING CAST(avail_time AS time)'
  end

  def down
    change_column :availabilities, :avail_time, :string
  end
end
