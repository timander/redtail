class CreateLunchPeriods < ActiveRecord::Migration
  def self.up
    create_table :lunch_periods do |t|
      t.integer :period
      t.string :name
      t.string :begin_end_times
      t.boolean :to_go_available

      t.timestamps
    end
  end

  def self.down
    drop_table :lunch_periods
  end
end
