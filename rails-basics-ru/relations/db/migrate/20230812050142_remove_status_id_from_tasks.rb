class RemoveStatusIdFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :status_id, :integer
  end
end
