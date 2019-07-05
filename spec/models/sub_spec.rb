# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sub, type: :model do
  before(:example) do
    @sub = Sub.new
  end

  it 'validates that name and description are present' do
    expect(@sub.valid?).to be false
  end
end
