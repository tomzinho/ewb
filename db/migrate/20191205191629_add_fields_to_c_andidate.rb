class AddFieldsToCAndidate < ActiveRecord::Migration[5.2]
  def change
    add_column :candidates, :work_city, :string
    add_column :candidates, :skills_list, :string
    add_column :candidates, :first_name, :string
    add_column :candidates, :last_name, :string
  end
end
