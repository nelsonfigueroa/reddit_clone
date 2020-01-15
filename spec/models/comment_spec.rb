# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  it 'validates that a comment is present' do
    expect(Comment.new.valid?).to be false
  end
end
