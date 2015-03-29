class CreateAvailabilities < ActiveRecord::Migration
  def change
   create_table :availabilities do |table|
  		table.string :avail_time, null: false
      	table.date :avail_date, null: false
  		table.integer :user_id, null: false

  		table.timestamps
  	end
  end
end
