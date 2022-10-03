class Relationship < ApplicationRecord
    belongs_to :follow, class_name: 'User'
    belongs_to :follower, class_name: 'User'
    
    with_options presence: true do
        validates :follow_id
        validates :follower_id
    end
end
