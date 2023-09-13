class CreateApiV1Likes < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_likes do |t|
      t.references :users, null: false, foreign_key: true
      t.references :api_v1_tweets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
