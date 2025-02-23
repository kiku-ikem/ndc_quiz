class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
