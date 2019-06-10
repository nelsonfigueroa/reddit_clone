require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "validates that a comment is present" do
    expect(Comment.new.valid?).to be false
  end
end
