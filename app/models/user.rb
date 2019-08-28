class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  #e-mailは長さ255文字まで、空文字を許さない
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end