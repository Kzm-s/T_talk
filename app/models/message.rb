class Message < ApplicationRecord
    belongs_to :user
    belongs_to :room



    with_options presence: true do
        validates :content
    end
end
