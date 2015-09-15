class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :status, length: {minimum: 1}
  has_many :likes, dependent: :destroy
end
