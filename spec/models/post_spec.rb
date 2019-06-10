require 'rails_helper'

RSpec.describe Post, type: :model do
  it "validates that title and content are present" do
    expect(Post.new.valid?).to be false
  end

  it "returns an integer when calling #net_votes" do
    expect(Post.new.net_votes).to be_an(Integer) 
  end
end
