class Friendship < ActiveRecord::Base
    belongs_to :user
    belongs_to :friend, :class_name => 'User'
    
    before_create :default_status
    
    validate :validate_user_id
    validate :validate_friend_id
    
    
    
    private
    enum status: { 
        pending: 0, 
        accepted: 1 
        
    }
    
    def default_status
       self.status = :pending
    end
    
    def validate_user_id 
        errors.add(:user_id, "is invalid") unless User.exists?(self.user_id)
    end
    
    def validate_friend_id 
        errors.add(:friend_id, "is invalid") unless User.exists?(self.friend_id)
    end
    
    
    
    
end
