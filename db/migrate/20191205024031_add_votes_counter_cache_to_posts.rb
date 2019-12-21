# frozen_string_literal: true

class AddVotesCounterCacheToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :votes_count, :integer
  end
end
