class Comment < ApplicationRecord
  belongs_to :blog
  validates :content, presence: false, length: {maximum: 140}
end
