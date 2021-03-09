class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :tweet, foreign_key: {on_delete: :cascade}
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
