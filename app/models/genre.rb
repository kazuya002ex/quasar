class Genre < ApplicationRecord

  validates :name, presence: true, length: { maximum: 20 }
  validates :desc, length: { maximum: 300 }
end
