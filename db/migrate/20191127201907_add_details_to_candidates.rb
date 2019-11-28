class AddDetailsToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :workauth_bra, :boolean
    add_column :candidates, :workauth_usa, :boolean
    add_column :candidates, :workauth_eu, :boolean
    add_column :candidates, :workauth_can, :boolean
    add_column :candidates, :workauth_gb, :boolean
    add_column :candidates, :workauth_aus, :boolean
  end
end
