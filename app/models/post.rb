class Post < ApplicationRecord

    enum post_type: { education: 0, advise: 1, other: 3 }, _prefix: true
    enum status: { open: 0, hidden: 1 }, _prefix: true
    self.inheritance_column = :_type_disabled

    mount_uploader :image, ImageUploader

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags, dependent: :destroy
    has_many :likes, dependent: :destroy

    def liked?(user)
        likes.where(user_id: user.id).exists?
    end



    with_options presence: true, on: :publicize do
        validates :title
        validates :content
        validates :status
        validates :post_tags
    end
end
