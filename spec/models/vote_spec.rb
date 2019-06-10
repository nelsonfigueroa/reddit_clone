require 'rails_helper'

RSpec.describe Vote, type: :model do

  it "validates that user_id and post_id are present" do
    expect(Vote.new.valid?).to be false
  end

  it "gets all up votes when #upvotes is called" do
    expect(Vote.upvotes).to match_array(Vote.where(upvote: true, downvote: false))
  end

  it "gets all down votes when #downvotes is called" do
    expect(Vote.downvotes).to match_array(Vote.where(upvote: false, downvote: true))
  end

end
