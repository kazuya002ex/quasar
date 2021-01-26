# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 32 }
  validates :content, presence: true, length: { maximum: 255 }
end
