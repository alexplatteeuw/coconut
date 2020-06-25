class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :address
      t.string :name
      t.text :description
      t.references :association, null: false, foreign_key: true

      t.timestamps
    end
  end
end
