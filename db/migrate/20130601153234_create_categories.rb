class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :title, :string

      t.timestamps
    end
  end
end
