class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.integer :restaurant_id
      t.integer :selection_id
      t.boolean :required

      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
