class CreateReskills < ActiveRecord::Migration[5.1]
  def change
    create_table :reskills do |t|
    	t.integer :resume_id
    	t.integer :skill_id
      t.timestamps
    end
  end
end
