class User < ActiveRecord::Base
  has_many :beers
  has_many :friendships
  has_many :friends, :through => :friendships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, uniqueness: true
  validates :username, presence: true
    
  before_create -> { self.auth_token = SecureRandom.hex }
  
  
  def is_admin?
    self.admin
  end
  
  def self.friendable id
    where.not(id: id).where.not(id: friend_ids(id))
  end
  
  def self.friend_ids userId
    find(userId).friends.ids
  end
end
