class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.string :address
      t.string :city
      t.integer :price
      t.text :description
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
