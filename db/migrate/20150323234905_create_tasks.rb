class CreateTasks < ActiveRecord::Migration
  def change
   create_table :tasks do |table|
  		table.string :tasks, null: false
      	table.date :task_date, null: false
  		table.string :task_time, null: false
  		table.string :location, null: false
  		table.integer :user_id, null: false

  		table.timestamps
  	end
  end
end
