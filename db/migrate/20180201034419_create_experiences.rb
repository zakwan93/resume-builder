class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :job_title
      t.string :company
      t.string :city
      t.string :state
      t.date :duration
      t.integer :resume_id
      t.timestamps
    end
  end
end
