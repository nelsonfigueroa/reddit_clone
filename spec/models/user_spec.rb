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
