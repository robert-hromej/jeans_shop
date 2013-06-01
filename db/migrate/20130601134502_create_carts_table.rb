class CreateCartsTable < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.column :user_id, :integer
      t.column :item_id, :integer, null: false
      t.column :count, :integer, null: false, default: 1

      t.belongs_to :item
      t.belongs_to :user

      t.timestamps
    end
  end
end
