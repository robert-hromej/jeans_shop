class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.column :title, :string
      t.column :price, :float
      t.column :original_price, :float
      t.column :count, :integer

      t.belongs_to :brand
      t.belongs_to :category
      t.belongs_to :color
      t.belongs_to :dress_size

      t.timestamps
    end
  end
end
