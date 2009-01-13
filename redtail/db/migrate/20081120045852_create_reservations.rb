class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :lunch_period_id
      t.string :take_out
      t.string :drink
      t.string :dressing
      t.string :special_request
      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
