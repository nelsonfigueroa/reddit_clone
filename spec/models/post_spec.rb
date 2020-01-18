# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe Post, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:forum) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  let(:post) { Post.new }
  let(:user) { User.new }
  let(:forum) { Forum.new }

  context 'when calling #net_votes' do
    it 'returns an integer' do
      expect(post.net_votes).to be_an(Integer)
    end
  end

  context 'when calling #created_at_formatted' do
    it 'returns a string of the date when calling #created_at_formatted' do
      post.title = Faker::String.random
      post.content = Faker::String.random
      post.user = user
      post.forum = forum
      post.save!
      expect(post.created_at_formatted).to be_a(String)
    end
  end
end
