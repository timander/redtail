class CreateDecisions < ActiveRecord::Migration
  def self.up
    create_table :decisions do |t|
      t.integer :reservation_id
      t.integer :selection_id
      t.integer :option_id

      t.timestamps
    end
  end

  def self.down
    drop_table :decisions
  end
end
