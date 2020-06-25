class CreateProjectsSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :projects_skills do |t|
      t.references :project, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.integer :duration_in_hours

      t.timestamps
    end
  end
end
