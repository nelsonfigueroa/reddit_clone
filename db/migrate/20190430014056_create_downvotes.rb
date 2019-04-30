class CreateDownvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :downvotes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
