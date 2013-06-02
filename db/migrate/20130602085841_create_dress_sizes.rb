class CreateDressSizes < ActiveRecord::Migration
  def change
    create_table :dress_sizes do |t|
      t.column :title, :string, null: false

      t.timestamps
    end
  end
end
