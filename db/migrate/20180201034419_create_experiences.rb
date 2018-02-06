class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.string :company
      t.date :startdate
      t.date :enddate
      t.text :description
      t.integer :resume_id
      t.timestamps
    end
  end
end
