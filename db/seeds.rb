require 'faker'

sub_owner = User.create(
  email: Faker::Internet.unique.email, 
  username: Faker::Internet.unique.user_name,
  password: Faker::Internet.password
)

3.times do
  Sub.create(
    user: sub_owner,
    name: Faker::Company.unique.name,
    description: Faker::Commerce.unique.department
  )
end

post_owner = User.create(
  email: Faker::Internet.unique.email, 
  username: Faker::Internet.unique.user_name,
  password: Faker::Internet.password
)

# for each sub, create 3 posts
Sub.all.each do |sub|
  3.times do
    Post.create(
      user: post_owner,
      sub: sub,
      title: Faker::Lorem.unique.word,
      content: Faker::Lorem.paragraph(sentence_count: 4)
    )
  end
end

commenter = User.create(
  email: Faker::Internet.unique.email, 
  username: Faker::Internet.unique.user_name,
  password: Faker::Internet.password
)

# for each post, create 2 comments
Post.all.each do |post|
  2.times do
    Comment.create(
      user: commenter,
      post: post,
      comment: Faker::Lorem.paragraph(sentence_count: 2)
    )
  end
end

# users to be upvoters/downvoters
voter_1 = User.create(
  email: Faker::Internet.unique.email, 
  username: Faker::Internet.unique.user_name,
  password: Faker::Internet.password
)

voter_2 = User.create(
  email: Faker::Internet.unique.email, 
  username: Faker::Internet.unique.user_name,
  password: Faker::Internet.password
)

voter_3 = User.create(
  email: Faker::Internet.unique.email, 
  username: Faker::Internet.unique.user_name,
  password: Faker::Internet.password
)

voters = [voter_1, voter_2, voter_3]

# add votes to each post
# posts with odd ID get negative net votes
# posts with even ID get positive net votes
Post.all.each do |post|
  if post.id.odd?
    voters.each do |voter|
      Vote.create(
        user: voter,
        post: post,
        upvote: 0,
        downvote: 1
      )
    end
  else
    voters.each do |voter|
      Vote.create(
        user: voter,
        post: post,
        upvote: 1,
        downvote: 0
      )
    end
  end
end


