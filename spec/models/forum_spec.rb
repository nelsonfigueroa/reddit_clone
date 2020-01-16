# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Forum, type: :model do
  
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:posts) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }

    it { should validate_uniqueness_of(:name) }
  end

  let(:post) { Post.new }
  let(:user) { User.new }
  let(:forum) { Forum.new }

  # context 'creating a forum' do
  #   it 'returns invalid if attributes are missing' do
  #     expect(forum.valid?).to be false
  #   end

  #   it 'validates that all attributes are present' do
  #     forum.name = Faker::String.random
  #     forum.description = Faker::String.random
  #     forum.user = user

  #     expect(forum.valid?).to be true
  #   end

  #   it 'validates that forum name is unique' do
  #     forum.name = Faker::String.random
  #     forum.description = Faker::String.random
  #     forum.user = user
  #     forum.save!

  #     forum_two = forum.dup
  #     forum_two.user = user

  #     # curly braces needed in this case
  #     expect { forum_two.save! }.to raise_error(ActiveRecord::RecordInvalid)
  #   end
  # end
end
