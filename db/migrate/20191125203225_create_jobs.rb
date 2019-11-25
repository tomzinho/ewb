class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :company, foreign_key: true
      t.string :title
      t.text :description
      t.string :location
      t.float :latitude
      t.float :longitude
      t.boolean :status

      t.timestamps
    end
  end
end
