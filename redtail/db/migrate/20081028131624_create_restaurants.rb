class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name
      t.date :date
      t.float :price
      t.boolean :open
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
