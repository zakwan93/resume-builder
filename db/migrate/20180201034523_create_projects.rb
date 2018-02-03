class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :experience_id
      t.integer :resume_id
      t.timestamps
    end
  end
end
