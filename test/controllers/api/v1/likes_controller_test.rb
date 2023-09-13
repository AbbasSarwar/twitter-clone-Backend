require "test_helper"

class Api::V1::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_like = api_v1_likes(:one)
  end

  test "should get index" do
    get api_v1_likes_url, as: :json
    assert_response :success
  end

  test "should create api_v1_like" do
    assert_difference("Api::V1::Like.count") do
      post api_v1_likes_url, params: { api_v1_like: { comments_id: @api_v1_like.comments_id, users_id: @api_v1_like.users_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_like" do
    get api_v1_like_url(@api_v1_like), as: :json
    assert_response :success
  end

  test "should update api_v1_like" do
    patch api_v1_like_url(@api_v1_like), params: { api_v1_like: { comments_id: @api_v1_like.comments_id, users_id: @api_v1_like.users_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_like" do
    assert_difference("Api::V1::Like.count", -1) do
      delete api_v1_like_url(@api_v1_like), as: :json
    end

    assert_response :no_content
  end
end
