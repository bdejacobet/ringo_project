class AddProjetToEnvironnement < ActiveRecord::Migration
  def self.up
    change_table :environnements do |t|
      t.integer :projet_id
    end
  end

  def self.down
    change_table :environnements do |t|
      t.remove :projet_id
    end
  end
end
