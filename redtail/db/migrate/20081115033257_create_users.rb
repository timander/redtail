class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :hashed_password, :limit => 40
      t.string :first_name
      t.string :last_name
      t.boolean :email_confirmed, :default => false
      t.boolean :admin, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
