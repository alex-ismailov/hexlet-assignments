class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, foreign_key: true

      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
