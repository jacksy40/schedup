class ChangeColumnTasksTime < ActiveRecord::Migration
  def up
    change_column :tasks, :task_time, 'time USING CAST(task_time AS time)'
  end

  def down
    change_column :tasks, :task_time, :string
  end
end
