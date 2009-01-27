class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :lunch_period_id
      t.boolean :to_go
      t.integer :drink_id
      t.integer :dressing_id
      t.string :special_request
      t.integer :number_of_guests
      t.string :names_of_guests
      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
