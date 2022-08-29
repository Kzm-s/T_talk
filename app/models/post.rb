class Post < ApplicationRecord

    enum type: { education: 0, advise: 1, }
    enum status: { open: 0, hidden: 1 }
    self.inheritance_column = :_type_disabled

    belongs_to :user
end
