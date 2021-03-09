class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.integer :rt_tweet_id
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
