class CreateObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :objectives do |t|
    	
    	t.text :description
    	t.integer :resume_id
      t.timestamps
    end
  end
end
