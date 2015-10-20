class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :password, :password_confirmation, length: { in: 8..20 }
  has_many :events
  has_many :comments
end
