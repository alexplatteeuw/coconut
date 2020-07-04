class ChangeColumnsFromReservation < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :start_date
    remove_column :reservations, :end_date
    add_column :reservations, :credits, :integer
  end
end
