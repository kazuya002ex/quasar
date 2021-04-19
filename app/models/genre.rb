class Genre < ApplicationRecord

  has_many :post_genres, dependent: :destroy
  has_many :posts, through: :post_genres

  validates :name, presence: true, length: { maximum: 20 }
  validates :desc, length: { maximum: 300 }
end
