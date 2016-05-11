class Flavor < ActiveRecord::Base
    belongs_to :user
    belongs_to :beer
    has_one :flavor_stat
end
