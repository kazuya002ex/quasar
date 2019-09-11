class Micropost < ApplicationRecord
  validates :content, presence: true, length: { maximum: 55 }
  belongs_to :user
  belongs_to :post
end
