class AddColumnNotes < ActiveRecord::Migration
  def up
    add_column :tasks, :note, :string
  end
  def down
    remove_column :tasks, :note
  end
end
