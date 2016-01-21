class Beer < ActiveRecord::Base
    belongs_to :user
    has_many :flavors
    accepts_nested_attributes_for :flavors
    
    validates :name, presence: true
end
