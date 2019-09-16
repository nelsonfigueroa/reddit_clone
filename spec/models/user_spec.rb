# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }

  context 'creating a user' do
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
    pending('Figuring out the best way to go about this.')
    # create a post with a vote
    # (might need to create a user, which creates a sub, which creates a post)
    # then expect #has_not_voted to be false when using the method on post
    # then create the vote
    # then expect the #has_not_voted method to be true

    # refer to vote_spec.rb to create all those objects
    # consider adding factories as a last thing to this whole project
    # or maybe keep adding controller tests and view tests
  end

  it 'determines whether a user has upvoted a post with #upvoted_post?' do
    pending('as above')
  end

  it 'determines whether a user has downvoted a post with #downvoted_post?' do
    pending('as above')
  end

  it 'returns posts that were upvoted by user with #upvoted_posts' do
    pending('as above')
  end

  it 'returns posts that were downvoted by a user with #downvoted_posts' do
    pending('as above')
  end
end
