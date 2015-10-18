class Event < ActiveRecord::Base
  validates :name, :timing, :location, :state, presence: true
  belongs_to :user
  has_many :users
  has_many :users_joined, through: :joins, source: :join
  has_many :comments
end
