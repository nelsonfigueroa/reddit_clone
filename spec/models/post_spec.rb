require 'rails_helper'

RSpec.describe Post, type: :model do

  # run before every example
  before(:example) do
    @post = Post.new
  end

  it "validates that title and content are present" do
    expect(@post.valid?).to be false
  end

  it "returns an integer when calling #net_votes" do
    expect(@post.net_votes).to be_an(Integer) 
  end
end
