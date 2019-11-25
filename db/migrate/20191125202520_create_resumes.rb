class CreateResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :resumes do |t|
      t.references :candidate, foreign_key: true
      t.string :resume_language
      t.text :description
      t.text :education
      t.text :skills
      t.text :experience
      t.string :video

      t.timestamps
    end
  end
end
