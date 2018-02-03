class CreateSummary < ActiveRecord::Migration[5.1]
  def change
    create_table :summary do |t|
    	t.text :description
    	t.integer :resume_id
      	t.timestamps
    end
  end
end

