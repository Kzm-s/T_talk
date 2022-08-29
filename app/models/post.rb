class Post < ApplicationRecord

    enum type: { education: 0, advise: 1, }, _prefix: true
    enum status: { open: 0, hidden: 1 }, _prefix: true
    self.inheritance_column = :_type_disabled

    belongs_to :user
    has_many :comments, dependent: :destroy
end
