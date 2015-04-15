class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :task_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
