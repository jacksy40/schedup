class CreateDate < ActiveRecord::Migration
  def change
    create_table :dates do |t|
      t.datetime :date, null: false
      t.integer  :user_id, null: false

      t.timestamps
    end
  end
end
