class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.string :company
      t.string :startdate
      t.string :enddate
      t.text :description
      t.integer :resume_id
      t.timestamps
    end
  end
end
