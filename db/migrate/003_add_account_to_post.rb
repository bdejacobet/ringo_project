class AddAccountToPost < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :account_id
    end
    #and assigns a user to all exiting posts
    first_account = Account.first
    Post.all.each { |p| p.update_attibute(:account, first_account) }
  end

  def self.down
    change_table :posts do |t|
      t.remove :account_id
    end
  end
end
