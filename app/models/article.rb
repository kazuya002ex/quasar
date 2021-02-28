# frozen_string_literal: true

class Article < ApplicationRecord
  enum news_type: { other: 0, notice: 1, update: 2 }, _prefix: true

  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :news_type, presence: true

  # TOPページに最新のNewsを4件表示する
  scope :latest_news, -> { order(created_at: 'desc').limit(4) }
end
