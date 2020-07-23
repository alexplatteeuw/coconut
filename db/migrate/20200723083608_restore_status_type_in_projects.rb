class RestoreStatusTypeInProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :status, :integer, default: 0
    add_column :projects, :status, :string, default: "created"
  end
end
