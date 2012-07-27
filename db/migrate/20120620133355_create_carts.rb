class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :items

      t.timestamps
    end
  end
end
