class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true
      t.string :website
      t.string :facebook_link
      t.string :twitter_link
      t.string :logo
      t.string :banner
      t.integer :cnpj
      t.string :address
      t.string :latitude
      t.string :longitude
      t.boolean :term_of_use
      t.string :source

      t.timestamps
    end
  end
end
