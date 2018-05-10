class CreateIntroductions < ActiveRecord::Migration[5.1]
  def change
    create_table :introductions do |t|

    	  t.string :name
      	t.string :title
      	t.string :address
      	t.string :phone
      	t.string :email
        t.string :linkdin
        t.string :portfolio
        t.string :github
      	t.integer :resume_id

      t.timestamps
    end
  end
end
