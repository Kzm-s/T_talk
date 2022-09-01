class Position < ApplicationRecord
    has_many :users, through: :user_positions, dependent: :destroy
    has_many :user_positions, dependent: :destroy
end
