class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.text :small_desc
      t.string :github_link
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :work_auth
      t.string :photo

      t.timestamps
    end
  end
end
