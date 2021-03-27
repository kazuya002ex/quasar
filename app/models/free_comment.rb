class FreeComment < ApplicationRecord
  belongs_to :post
  
  validates :content, presence: true, length: { maximum: 55 }
  validates :username, presence: true, length: { maximum: 25 }
end
