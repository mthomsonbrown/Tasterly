class User < ActiveRecord::Base
  has_many :beers
  has_many :friendships
  has_many :friends, :through => :friendships
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
    before_create -> { self.auth_token = SecureRandom.hex }
end
