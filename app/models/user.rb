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
end
