class AddLogoToCharities < ActiveRecord::Migration[6.0]
  def change
    add_column :charities, :logo, :string
  end
end
