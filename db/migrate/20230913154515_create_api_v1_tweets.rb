class CreateApiV1Tweets < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_tweets do |t|
      t.text :text
      t.integer :comments
      t.integer :likes
      t.integer :retweets
      t.integer :views
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
