class Tag < ApplicationRecord
  has_many :post_tags, dependent: :nullify #tag deleted => tag_id = null
  has_many :posts, through: :post_tags

  validates :name, presence: true, uniqueness: true
end
