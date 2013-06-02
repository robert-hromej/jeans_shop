class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.column :title, :string, null: false

      t.timestamps
    end
  end
end
