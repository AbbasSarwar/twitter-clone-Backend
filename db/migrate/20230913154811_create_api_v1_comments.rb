class CreateApiV1Comments < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_comments do |t|
      t.string :text
      t.references :users, null: false, foreign_key: true
      t.references :api_v1_tweets, null: false, foreign_key: true

      t.timestamps
    end
  end
end
