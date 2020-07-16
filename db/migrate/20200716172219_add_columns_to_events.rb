class AddColumnsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :color, :string
    rename_column :events, :start_time, :start
    rename_column :events, :end_time, :end
  end
end
