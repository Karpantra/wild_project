class AddSeedPictureToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :seed_picture, :string
  end
end
