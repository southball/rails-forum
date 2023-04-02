class Post < ApplicationRecord
  belongs_to :board
  belongs_to :author, class_name: 'User'
  has_many :comments

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
