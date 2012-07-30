class CreateEnvironnements < ActiveRecord::Migration
  def self.up
    create_table :environnements do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :environnements
  end
end
