class Post < ApplicationRecord

    enum post_type: { education: 0, advise: 1, }, _prefix: true
    enum status: { open: 0, hidden: 1 }, _prefix: true
    self.inheritance_column = :_type_disabled

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags, dependent: :destroy
end
