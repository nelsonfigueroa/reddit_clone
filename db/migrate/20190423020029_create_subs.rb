class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true, column: :sub_owner_id
      t.timestamps
    end
  end
end
