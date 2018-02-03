class CreateEducations < ActiveRecord::Migration[5.1]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :degree
      t.integer :year_graduated
      t.integer :resume_id
      t.timestamps
    end
  end
end
