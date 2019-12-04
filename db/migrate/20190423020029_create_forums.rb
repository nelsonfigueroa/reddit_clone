# frozen_string_literal: true

class CreateForums < ActiveRecord::Migration[5.2]
  def change
    create_table :forums do |t|
      t.string :name
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
