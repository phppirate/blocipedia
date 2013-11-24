class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attr_accessible :body, :description, :name, :private, :slug
  belongs_to :user
end
