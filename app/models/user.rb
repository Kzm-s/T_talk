class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum gender: { "男性": 1, "女性": 2 }
  enum job_title: { "校長": 1, "副校長": 2, "教頭": 3, "主幹教諭": 4, "指導教諭": 5, "指導主事": 6, "教諭": 7, "養護教諭": 8, "常勤講師": 9, "非常勤講師": 10, "その他": 11 }
  enum career: { "1年未満": 1, "1年目": 2, "2年目": 3, "3年目": 4, "4年目": 5, "5年目": 6, "6年目": 7, "7年目": 8, "8年目": 9, "9年目": 10, "10年目": 11, "11年目": 12, "12年目": 13, "13年目": 14, "14年目": 15, "15年目": 16, "16年目": 17, "17年目": 18, "18年目": 19, "19年目": 20, "20年目": 21, "20年以上": 22 }
  enum subject: { "算数": 1, "国語": 2, "理科": 3, "社会": 4, "体育": 5, "音楽": 6, "家庭": 7, "外国語": 8, "図画工作": 9, "生活": 10, "道徳": 11, "それ以外": 12 }
  enum grade: {  "なし": 1, "1年生": 2, "2年生": 3, "3年生": 4, "4年生": 5, "5年生": 6, "6年生": 7, "特別支援学級": 8 }
  enum other: { "そのほか": 1, "ない": 2 }
end
