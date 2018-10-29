class User < ApplicationRecord
  has_secure_password

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_many :active_votes, foreign_key: 'follower_id', class_name: 'Vote', dependent: :destroy
  has_many :passive_votes, foreign_key: 'followed_id', class_name: 'Vote', dependent: :destroy
  has_many :following, through: :active_votes, source: :followed
  has_many :followers, through: :passive_votes, source: :follower
end
