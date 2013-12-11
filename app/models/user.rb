class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :premium, :name, :user_id, :wiki_id
 
  has_many :wikis

  has_many :collaborations
  has_many :collaborated_wikis, through: :collaborations, class_name: 'Wiki', primary_key: :wiki_id, source: :wiki  

  def premium
    if self.premium_at.blank?
      return false
    elsif self.premium_at < 1.month.ago
      return false
    else
      true
    end
  end

  alias :premium? :premium

end