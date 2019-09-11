class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 55 }
  validates :story, presence: true, length: { maximum: 300 }
  validates :order, presence: true, length: { maximum: 300 }
end
