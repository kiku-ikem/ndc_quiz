class Book < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user
  # 書誌情報のバリデーション等を追加
end
