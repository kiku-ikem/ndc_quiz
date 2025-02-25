class User < ApplicationRecord
  authenticates_with_sorcery!

  # 新規登録時のみパスワードの存在と8文字以上をチェックする
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
