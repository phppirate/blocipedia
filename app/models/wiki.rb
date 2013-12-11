class Wiki < ActiveRecord::Base
  attr_accessible :body, :description, :name, :private

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user

  has_many :users, through: :collaborations 
  has_many :collaborations

end