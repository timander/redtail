class CreateDrinks < ActiveRecord::Migration
  def self.up
    create_table :drinks do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :drinks
  end
end
