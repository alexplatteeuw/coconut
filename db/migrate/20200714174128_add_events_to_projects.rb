class AddEventsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :events, :string
  end
end
