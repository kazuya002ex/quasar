# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :img, ImgUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 依頼人が消えても作品は残る
  has_many :posts
  # 著者が消えても投稿は残る
  has_many :microposts
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  has_many :articles

  validates :name, presence: true, length: { maximum: 25 }

  scope :rand, -> { order(Arel.sql('rand()')).limit(10) }

  # お気に入り機能関係
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
