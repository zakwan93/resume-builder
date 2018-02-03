class CreateOtherprojects < ActiveRecord::Migration[5.1]
  def change
    create_table :otherprojects do |t|

      t.string :name
      t.integer :resume_id
      t.timestamps
    end
  end
end
