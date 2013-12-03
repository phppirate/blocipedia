class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  validates :description, presence: true, length: {maximum: 100}
  validates :name, presence: true
  validates :body, presence: true
  
  

  attr_accessible :body, :description, :name, :private, :slug
  belongs_to :user
  has_many :collaborations
end
