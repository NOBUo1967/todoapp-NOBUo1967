class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.string :task_name, null: false
      t.text :task_description, null: false
      t.date :task_term
      t.timestamps
    end
  end
end
