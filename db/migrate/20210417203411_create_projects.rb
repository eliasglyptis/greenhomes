class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :type, default: false
      t.integer :estimated_effort
      t.integer :actual_effort
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
