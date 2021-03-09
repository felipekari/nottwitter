class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.bigint :user_id
      t.bigint :follower_id
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
