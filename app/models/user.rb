class User < ApplicationRecord
    has_many :posts, dependent: :destroy #borrar usuario => se borran sus posts

end
