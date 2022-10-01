class Comment < ApplicationRecord

    enum status: { open: 0, hidden: 1 }, _prefix: true

    belongs_to :user
    belongs_to :post

    validates :comment_content, presence: true
    validates :status, presence: true

end
