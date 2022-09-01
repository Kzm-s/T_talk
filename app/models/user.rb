class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum gender: { man: 0, woman: 1 }, _prefix: true
  enum job_title: { principal: 0, second_master: 1, head: 2, senior_teacher: 3, leading_teacher: 4, supervisor: 5, teacher: 6, school_nurce: 7, full_time_teacher: 8, part_time_teacher: 9, other: 10 }, _prefix: true
  enum career: { under_one: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9, ten: 10, eleven: 11, twelve: 12, thirteen: 13, fourteen: 14, fifteen: 15, sixteen: 16, seventeen: 17, eighteen: 18, nineteen: 19, twenty: 20, over_twenty: 21 }, _prefix: true
  enum subject: { math: 0, japanese: 1, science: 2, social_study: 3, PE: 4, music: 5, home_economic: 6, english: 7, arts_and_crafts: 8, lifestyle: 9, moral: 10, other: 11 }, _prefix: true
  enum grade: {  none: 0, first: 1, second: 2, third: 3, fourth: 4, fifth: 5, sixth: 6, special: 7 }, _prefix: true
  enum other: { none: 0, other: 1 }, _prefix: true

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :user_positions, dependent: :destroy
  has_many :positions, through: :user_positions, dependent: :destroy
end
