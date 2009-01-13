class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :hashed_password, :limit => 40
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :email_confirmed, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
