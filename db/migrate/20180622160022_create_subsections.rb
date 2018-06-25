class CreateSubsections < ActiveRecord::Migration[5.1]
  def change
    create_table :subsections do |t|
      t.string :name
      t.string :desc1
      t.string :desc2
      t.string :desc3
      t.string :desc4
      t.string :date
      t.integer :section_id
   
      t.timestamps
    end
  end
end
