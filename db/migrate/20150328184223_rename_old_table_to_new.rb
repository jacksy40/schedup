class RenameOldTableToNew < ActiveRecord::Migration
  def up
    rename_table :dates, :selectdates
  end
  def down
    rename_table :selectdates, :dates
  end
end
