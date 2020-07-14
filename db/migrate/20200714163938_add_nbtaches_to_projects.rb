class AddNbtachesToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :nbtaches, :integer
  end
end
