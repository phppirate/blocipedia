class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :stripe_card_token
      t.string :stripe_customer_token
      t.string :user_id

      t.timestamps
    end
  end
end
