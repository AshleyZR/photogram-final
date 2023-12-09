# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "" unless column_exists?(:users, :email)
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)
  
      ## Recoverable
      t.string   :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)
  
      ## Rememberable
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)
  
      # ... (Continue this pattern for each column that Devise adds)
      
      t.string :username unless column_exists?(:users, :username)
      t.integer :comments_count unless column_exists?(:users, :comments_count)
      t.integer :likes_count unless column_exists?(:users, :likes_count)
      t.boolean :private unless column_exists?(:users, :private)
      t.integer :sent_follow_requests_count unless column_exists?(:users, :sent_follow_requests_count)
      t.integer :received_follow_requests_count unless column_exists?(:users, :received_follow_requests_count)
      t.integer :own_photos_count unless column_exists?(:users, :own_photos_count)
  
      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false unless column_exists?(:users, :created_at)
    end
  
    add_index :users, :email,                unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    # ... (Continue this pattern for each index that Devise adds)
  end
  

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
