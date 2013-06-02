class Initial < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :title, null: false
      t.timestamps
    end
    add_index :brands, :title, unique: true

    create_table :carts do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.integer :count, default: 0, null: false
      t.timestamps
    end

    create_table :categories do |t|
      t.string :title, null: false
      t.timestamps
    end
    add_index :categories, :title, unique: true

    create_table :colors do |t|
      t.string :title, null: false
      t.timestamps
    end
    add_index :colors, :title, unique: true

    create_table :dress_sizes do |t|
      t.string :title, null: false
      t.timestamps
    end
    add_index :dress_sizes, :title, unique: true

    create_table :items do |t|
      t.string :title, null: false
      t.float :price, null: false
      t.float :original_price, null: false
      t.integer :count, default: 0, null: false
      t.integer :brand_id, null: false
      t.integer :category_id, null: false
      t.integer :color_id, null: false
      t.integer :dress_size_id, null: false
      t.timestamps
    end
    add_index :items, :title, unique: true
    add_index :items, %w(title brand_id category_id color_id dress_size_id), unique: true, :name => 'items_uniq_index'

    create_table :users do |t|
      t.string :email, default: '', null: false
      t.string :encrypted_password, default: '', null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email, name: 'index_users_on_email', unique: true
    add_index :users, :reset_password_token, name: 'index_users_on_reset_password_token', unique: true
  end
end
