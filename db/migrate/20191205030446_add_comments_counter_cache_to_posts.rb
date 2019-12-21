# frozen_string_literal: true

class AddCommentsCounterCacheToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :comments_count, :integer
  end
end
