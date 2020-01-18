# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vote, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }

    # buggy? might need to manually create record(s)
    # https://github.com/thoughtbot/shoulda-matchers/issues/745
    # it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end

  it 'gets all up votes when #upvotes is called' do
    expect(Vote.upvotes).to match_array(Vote.where(upvote: true, downvote: false))
  end

  it 'gets all down votes when #downvotes is called' do
    expect(Vote.downvotes).to match_array(Vote.where(upvote: false, downvote: true))
  end
end
