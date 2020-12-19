class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 32 }
  validates :story, presence: true, length: { maximum: 300 }
  validates :order, presence: true, length: { maximum: 300 }
  belongs_to :user, optional: true
  has_many :microposts, dependent: :destroy

  # TOPページのランキングを表示する（未完成）
  scope :rank, -> { order("RAND()").limit(10) }

  # TOPページの新着10件を表示する
  scope :new_arriv, -> { last(10).reverse }

  # 依頼作品を表示する
  scope :my_request, -> (user){ where(user_id: user.id).order(created_at: 'desc') }
end