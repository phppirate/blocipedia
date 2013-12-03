class Subscription < ActiveRecord::Base
  attr_accessible :stripe_card_token, :stripe_customer_token, :user_id

  belongs_to :user
end
