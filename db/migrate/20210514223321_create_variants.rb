class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :title
      t.text :description
      t.integer :variant_number
      t.integer :variant_type
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
