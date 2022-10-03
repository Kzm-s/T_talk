class Comment < ApplicationRecord

  enum status: { open: 0, hidden: 1 }, _prefix: true

  belongs_to :user
  belongs_to :post

  with_options presence: true do
    validates :comment_content
    validates :status
  end

end
