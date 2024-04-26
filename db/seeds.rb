# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.destroy_all
User.destroy_all
PostTag.destroy_all
Tag.destroy_all
# Each user should have one post minimum.
# Each post should have at least one tag.
# Each tag should be associated with at least one post.

#USERS
# 5.times do
#   from_date = DateTime.new(2022, 1, 1)
#   to_date = DateTime.now
#   random_time= Faker::Time.between(from: from_date, to: to_date)
#   user = User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.email,
#     password: Faker::Internet.password(min_length: 6)
#   )

#   #create post for each user (minimum 1 post per user)
#   post = user.posts.create(
#     title: Faker::Lorem.sentence,
#     content: Faker::Lorem.paragraph,
#     published_at: random_time
#   )
#   3.times do
#     tag = Tag.create(name: Faker::Lorem.word)
#     post.tags << tag
#   end
# end
# 5.times do
#   from_date = DateTime.new(2022, 1, 1)
#   to_date = DateTime.now
#   random_time= Faker::Time.between(from: from_date, to: to_date)
#   post = user.posts.create(
#     title: Faker::Lorem.sentence,
#     content: Faker::Lorem.paragraph,
#     published_at: random_time
#   )
# end
#          USERS
user1 = User.create(name: 'John Doe',
                    email: 'john.doe@example.com',
                    password: 'password1')
user2 = User.create(name: 'Jane Smith',
                    email: 'jane.smith@example.com',
                    password: 'password2')
user3 = User.create(name: 'Emily Davis',
                    email: 'emily.davis@example.com',
                    password: 'password3')
user4 = User.create(name: 'David Brown',
                    email: 'david.brown@example.com',
                    password: 'password4')
user5 = User.create(name: 'Michael Johnson',
                    email: 'michael.johnson@example.com',
                    password: 'password5')
#          TAGS
tag1 = Tag.create(name: 'Tag 1')
tag2 = Tag.create(name: 'Tag 2')
tag3 = Tag.create(name: 'Tag 3')
tag4 = Tag.create(name: 'Tag 4')
tag5 = Tag.create(name: 'Tag 5')
#          POSTS
#USER1
post1 = user1.posts.create(title: 'Post 1',
                          content: 'Post 1 Content')
                          post1.tags << tag1
                          post1.tags << tag3
                          post1.tags << tag5
post6 = user1.posts.create(title: 'Post 6',
                          content: 'Post 6 Content')
                          post6.tags << tag3
                          post6.tags << tag2
#USER2
post2 = user2.posts.create(title: 'Post 2',
                          content: 'Post 2 Content')
                          post2.tags << tag2
                          post2.tags << tag4
post7 = user2.posts.create(title: 'Post 7',
                          content: 'Post 7 Content')
                          post7.tags << tag4
#USER3
post3 = user3.posts.create(title: 'Post 3',
                          content: 'Post 3 Content')
                          post3.tags << tag3
                          post3.tags << tag5
                          post3.tags << tag4
                          post3.tags << tag2
post8 = user3.posts.create(title: 'Post 8',
                          content: 'Post 8 Content')
                          post8.tags << tag1
                          post8.tags << tag2
#USER4
post4 = user4.posts.create(title: 'Post 4',
                          content: 'Post 4 Content')
                          post4.tags << tag4
post9 = user4.posts.create(title: 'Post 9',
                          content: 'Post 9 Content')
                          post9.tags << tag1
#USER5
post5 = user5.posts.create(title: 'Post 5',
                          content: 'Post 5 Content')
                          post5.tags << tag5
post10 = user5.posts.create(title: 'Post 10',
                          content: 'Post 10 Content')
                          post10.tags << tag2


# EXTRA: PARENT-CHILD POSTS
#Parent Posts
parent_post1 = user1.posts.create(title: "Parent Post 1", content: "Content of Parent Post 1")
                          parent_post1.tags << tag1
                          parent_post1.tags << tag3
parent_post2 = user2.posts.create(title: "Parent Post 2", content: "Content of Parent Post 2")
                          parent_post2.tags << tag2
                          parent_post2.tags << tag4
#Create Child Posts
child_post1 = user2.posts.create(title: "Child Post 1", content: "Content of Child Post 1", parent_post_id: parent_post1.id)
                          child_post1.tags << tag5
child_post2 = user3.posts.create(title: "Child Post 2", content: "Content of Child Post 2", parent_post_id: parent_post1.id)
                          child_post2.tags << tag1
child_post3 = user4.posts.create(title: "Child Post 3", content: "Content of Child Post 3", parent_post_id: parent_post2.id)
                          child_post3.tags << tag5
