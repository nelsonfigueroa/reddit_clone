# frozen_string_literal: true

require 'rails_helper'
require 'pry'

RSpec.describe Post, type: :model do
  # run before every example
  let(:post) { Post.new }
  let(:user) { User.new }
  let(:sub) { Sub.new }

  context 'creating a post' do 
    it 'returns invalid if attributes are missing' do
      expect(post.valid?).to be false
    end
  
    it 'validates that title and content are present' do
      post.title = 'Title'
      post.content = 'Content'
      post.user = user
      post.sub = sub
      post.save!
      expect(post.valid?).to be true
    end
  end

  it 'returns an integer when calling #net_votes' do
    expect(post.net_votes).to be_an(Integer)
  end

  it 'returns a string of the date when calling #created_at_formatted' do
    post.title = 'Title'
    post.content = 'Content'
    post.user = user
    post.sub = sub
    post.save!
    expect(post.created_at_formatted).to be_a(String)
  end
end
