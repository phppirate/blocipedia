class AddPremiumDateToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.datetime :premium_at
    end
    change_table :users do |t|
      t.index :premium_at
    end
    User.where(:premium => true).each { |u| u.update_attribute(:premium_at, Time.now) }
    remove_column :users, :premium
  end
end
