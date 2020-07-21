class ChangeStatusTypeInProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :status
    add_column :projects, :status, :integer, default: 0
  end
end
