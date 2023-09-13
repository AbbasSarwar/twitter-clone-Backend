require "test_helper"

class Api::V1::TweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_tweet = api_v1_tweets(:one)
  end

  test "should get index" do
    get api_v1_tweets_url, as: :json
    assert_response :success
  end

  test "should create api_v1_tweet" do
    assert_difference("Api::V1::Tweet.count") do
      post api_v1_tweets_url, params: { api_v1_tweet: { comments: @api_v1_tweet.comments, likes: @api_v1_tweet.likes, retweets: @api_v1_tweet.retweets, text: @api_v1_tweet.text, user_id: @api_v1_tweet.user_id, views: @api_v1_tweet.views } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_tweet" do
    get api_v1_tweet_url(@api_v1_tweet), as: :json
    assert_response :success
  end

  test "should update api_v1_tweet" do
    patch api_v1_tweet_url(@api_v1_tweet), params: { api_v1_tweet: { comments: @api_v1_tweet.comments, likes: @api_v1_tweet.likes, retweets: @api_v1_tweet.retweets, text: @api_v1_tweet.text, user_id: @api_v1_tweet.user_id, views: @api_v1_tweet.views } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_tweet" do
    assert_difference("Api::V1::Tweet.count", -1) do
      delete api_v1_tweet_url(@api_v1_tweet), as: :json
    end

    assert_response :no_content
  end
end
