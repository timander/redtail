class CreateSelections < ActiveRecord::Migration
  def self.up
    create_table :selections do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :selections
  end
end
