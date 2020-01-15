# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  it 'validates that user_id and post_id are present' do
    vote = Vote.new
    expect(vote.valid?).to be false

    user = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    forum = Forum.create(
      user: user,
      name: Faker::String.random,
      description: Faker::String.random
    )

    post = Post.create(
      title: 'post title',
      content: 'post content',
      user: user,
      forum: forum
    )

    vote.user_id = user.id
    vote.post_id = post.id
    vote.save!

    expect(vote.valid?).to be true
  end

  it 'gets all up votes when #upvotes is called' do
    expect(Vote.upvotes).to match_array(Vote.where(upvote: true, downvote: false))
  end

  it 'gets all down votes when #downvotes is called' do
    expect(Vote.downvotes).to match_array(Vote.where(upvote: false, downvote: true))
  end
end
