class Post < ApplicationRecord
    belongs_to :user

    has_many :child_posts, class_name: 'Post', foreign_key: :parent_post_id, dependent: :destroy
    belongs_to :parent_post, class_name: 'Post', optional: true

    has_many :post_tags,dependent: :delete_all #post is deleted => post_tags deleted
    has_many :tags, through: :post_tags

    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }

    before_validation :set_published_at_default
    private
      def set_published_at_default
        self.published_at ||= Time.zone.now
      end
end
