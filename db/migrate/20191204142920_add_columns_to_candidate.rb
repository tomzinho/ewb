class AddColumnsToCandidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :work_city, :string,
    add_column :candidates, :skills_list, :string
  end
end
