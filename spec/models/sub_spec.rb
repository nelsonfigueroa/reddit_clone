# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sub, type: :model do
  let(:post) { Post.new }
  let(:user) { User.new }
  let(:sub) { Sub.new }

  context 'creating a sub' do 
    it 'returns invalid if attributes are missing' do
      expect(sub.valid?).to be false
    end

    it 'validates that all attributes are present' do
      sub.name = 'Sub Name'
      sub.description = 'Sub Description'
      sub.user = user

      expect(sub.valid?).to be true
    end

    it 'validates that sub name is unique' do
      sub.name = 'Sub Name'
      sub.description = 'Sub Description'
      sub.user = user
      sub.save!

      sub_two = sub.dup
      sub_two.user = user
      
      # curly braces needed in this case
      expect{sub_two.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
