class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :admin, :boolean
    add_column :users, :description, :text
    add_reference :users, :company, foreign_key: true
  end
end
