# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user, optional: true
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :free_comments, dependent: :destroy
  has_many :post_genres, dependent: :destroy
  has_many :genres, through: :post_genres

  validates :title, presence: true, length: { maximum: 32 }
  validates :story, presence: true, length: { maximum: 300 }
  validates :order, presence: true, length: { maximum: 300 }

  # TOPページのランキングを表示する（未完成）
  scope :rank, -> { order(Arel.sql('rand()')).limit(10) }

  # TOPページの新着10件を表示する
  scope :new_arriv, -> { last(10).reverse }

  # 依頼作品を表示する
  scope :my_request, -> (user){ where(user_id: user.id).order(created_at: 'desc') }

  def save_genres(genre_ids)
    post_genre = Genre.find_by(id: genre_ids)
    self.genres << post_genre
  end
end
