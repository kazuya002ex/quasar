# frozen_string_literal: true

class Micropost < ApplicationRecord
  has_many :micropost_stars
  belongs_to :user
  belongs_to :post
  
  validates :content, presence: true, length: { maximum: 55 }
end
