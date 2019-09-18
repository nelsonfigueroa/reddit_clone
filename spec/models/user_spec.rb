# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    let(:user) { User.new }

    it 'returns invalid if attributes are missing' do
      expect(user.valid?).to be false
    end

    it 'validates that all attributes are present' do
      user.email = "test@test.com"
      user.username = "test_username"
      user.password = "password123!"
      user.save!
      expect(user.valid?).to be true
    end
  end

  it 'determines whether the user has voted on a post with #has_not_voted' do
    user_one = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    user_two = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    sub = Sub.create(
      user: user_two,
      name: 'sub name',
      description: 'sub description'
    )

    post = Post.create(
      title: 'post title',
      content: 'post content',
      user: user_two,
      sub: sub
    )

    vote = Vote.create(
      user_id: user_two.id,
      post_id: post.id,
      upvote: 1,
      downvote: 0
    )

    expect(user_one.has_not_voted?(post)).to be true
  end

  it 'determines whether a user has upvoted a post with #upvoted_post?' do
    user = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    sub = Sub.create(
      user: user,
      name: 'sub name',
      description: 'sub description'
    )

    post = Post.create(
      title: 'post title',
      content: 'post content',
      user: user,
      sub: sub
    )

    vote = Vote.create(
      user_id: user.id,
      post_id: post.id,
      upvote: 1,
      downvote: 0
    )

    expect(user.upvoted_post?(post)).to be true
  end

  it 'determines whether a user has downvoted a post with #downvoted_post?' do
    user = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    sub = Sub.create(
      user: user,
      name: 'sub name',
      description: 'sub description'
    )

    post = Post.create(
      title: 'post title',
      content: 'post content',
      user: user,
      sub: sub
    )

    vote = Vote.create(
      user_id: user.id,
      post_id: post.id,
      upvote: 0,
      downvote: 1
    )

    expect(user.downvoted_post?(post)).to be true
  end

  it 'returns posts that were upvoted by user with #upvoted_posts' do
    user = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    sub = Sub.create(
      user: user,
      name: 'sub name',
      description: 'sub description'
    )

    post = Post.create(
      title: 'post title',
      content: 'post content',
      user: user,
      sub: sub
    )

    vote = Vote.create(
      user_id: user.id,
      post_id: post.id,
      upvote: 1,
      downvote: 0
    )

    post_two = Post.create(
      title: 'post title',
      content: 'post content',
      user: user,
      sub: sub
    )

    # downvoted post this time
    vote_two = Vote.create(
      user_id: user.id,
      post_id: post_two.id,
      upvote: 0,
      downvote: 1
    )

    user_upvoted_posts = user.upvoted_posts
    all_upvoted_posts = Post.joins(:votes).where(:votes => { upvote: 1, downvote: 0} )

    expect(user_upvoted_posts).to match_array(all_upvoted_posts)
  end

  it 'returns posts that were downvoted by a user with #downvoted_posts' do
    user = User.create(
      email: 'test@test.com',
      password: 'testing123',
      username: 'test'
    )

    sub = Sub.create(
      user: user,
      name: 'sub name',
      description: 'sub description'
    )

    post = Post.create(
      title: 'post title',
      content: 'post content',
      user: user,
      sub: sub
    )

    vote = Vote.create(
      user_id: user.id,
      post_id: post.id,
      upvote: 0,
      downvote: 1
    )

    post_two = Post.create(
      title: 'post title',
      content: 'post content',
      user: user,
      sub: sub
    )

    # upvoted post this time
    vote_two = Vote.create(
      user_id: user.id,
      post_id: post_two.id,
      upvote: 1,
      downvote: 0
    )

    user_downvoted_posts = user.downvoted_posts
    all_downvoted_posts = Post.joins(:votes).where(:votes => { upvote: 0, downvote: 1} )

    expect(user_downvoted_posts).to match_array(all_downvoted_posts)
  end
end
