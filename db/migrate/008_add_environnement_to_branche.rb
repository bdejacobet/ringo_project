class AddEnvironnementToBranche < ActiveRecord::Migration
  def self.up
    change_table :branches do |t|
      t.integer :environnement_id
    end
  end

  def self.down
    change_table :branches do |t|
      t.remove :environnement_id
    end
  end
end
