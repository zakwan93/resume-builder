class CreateIntroductions < ActiveRecord::Migration[5.1]
  def change
    create_table :introductions do |t|

    	  t.string :name
      	t.string :title
      	t.string :address
      	t.string :phone
      	t.string :email
      	t.integer :resume_id

      t.timestamps
    end
  end
end
