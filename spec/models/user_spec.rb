# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should have_many(:forums) }
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:username) }
  end

  # context 'when creating a user' do
  #   let(:user) { User.new }

  #   it 'returns invalid if attributes are missing' do
  #     expect(user.valid?).to be false
  #   end

  #   it 'validates that all attributes are present' do
  #     user.email = Faker::Internet.email
  #     user.username = Faker::Internet.username
  #     user.password = Faker::Internet.password
  #     user.save!
  #     expect(user.valid?).to be true
  #   end
  # end

  context 'when voting as a user' do
    let(:user) do
      User.create(email: Faker::Internet.unique.email,
                  password: Faker::Internet.unique.password,
                  username: Faker::Internet.unique.username)
    end
    let(:user_two) do
      User.create(email: Faker::Internet.unique.email,
                  password: Faker::Internet.unique.password,
                  username: Faker::Internet.unique.username)
    end

    it 'determines whether the user has voted on a post with #has_not_voted' do
      forum = Forum.create(
        user: user_two,
        name: Faker::String.random,
        description: Faker::String.random
      )

      post = Post.create(
        title: Faker::String.random,
        content: Faker::String.random,
        user: user_two,
        forum: forum
      )

      vote = Vote.create(
        user_id: user_two.id,
        post_id: post.id,
        upvote: 1,
        downvote: 0
      )

      expect(user.has_not_voted?(post)).to be true
      expect(user_two.has_not_voted?(post)).to be false
    end

    it 'determines whether a user has upvoted a post with #upvoted_post?' do
      forum = Forum.create(
        user: user,
        name: Faker::String.random,
        description: Faker::String.random
      )

      post = Post.create(
        title: Faker::String.random,
        content: Faker::String.random,
        user: user,
        forum: forum
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
      forum = Forum.create(
        user: user,
        name: Faker::String.random,
        description: Faker::String.random
      )

      post = Post.create(
        title: Faker::String.random,
        content: Faker::String.random,
        user: user,
        forum: forum
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
      forum = Forum.create(
        user: user,
        name: Faker::String.random,
        description: Faker::String.random
      )

      post = Post.create(
        title: Faker::String.random,
        content: Faker::String.random,
        user: user,
        forum: forum
      )

      vote = Vote.create(
        user_id: user.id,
        post_id: post.id,
        upvote: 1,
        downvote: 0
      )

      post_two = Post.create(
        title: Faker::String.random,
        content: Faker::String.random,
        user: user,
        forum: forum
      )

      # downvoted post this time
      vote_two = Vote.create(
        user_id: user.id,
        post_id: post_two.id,
        upvote: 0,
        downvote: 1
      )

      user_upvoted_posts = user.upvoted_posts
      all_upvoted_posts = Post.joins(:votes).where(votes: { upvote: 1, downvote: 0 })

      expect(user_upvoted_posts).to match_array(all_upvoted_posts)
    end

    it 'returns posts that were downvoted by a user with #downvoted_posts' do
      forum = Forum.create(
        user: user,
        name: Faker::String.random,
        description: Faker::String.random
      )

      post = Post.create(
        title: Faker::String.random,
        content: Faker::String.random,
        user: user,
        forum: forum
      )

      vote = Vote.create(
        user_id: user.id,
        post_id: post.id,
        upvote: 0,
        downvote: 1
      )

      post_two = Post.create(
        title: Faker::String.random,
        content: Faker::String.random,
        user: user,
        forum: forum
      )

      # upvoted post this time
      vote_two = Vote.create(
        user_id: user.id,
        post_id: post_two.id,
        upvote: 1,
        downvote: 0
      )

      user_downvoted_posts = user.downvoted_posts
      all_downvoted_posts = Post.joins(:votes).where(votes: { upvote: 0, downvote: 1 })

      expect(user_downvoted_posts).to match_array(all_downvoted_posts)
    end
  end
end
