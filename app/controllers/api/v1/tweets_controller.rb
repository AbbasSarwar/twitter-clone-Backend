class Api::V1::TweetsController < ApplicationController
  before_action :set_api_v1_tweet, only: %i[ show update destroy ]

  # GET /api/v1/tweets
  def index
    @api_v1_tweets = Api::V1::Tweet.all

    render json: @api_v1_tweets
  end

  # GET /api/v1/tweets/1
  def show
    render json: @api_v1_tweet
  end

  # POST /api/v1/tweets
  def create
    @api_v1_tweet = Api::V1::Tweet.new(api_v1_tweet_params)

    if @api_v1_tweet.save
      render json: @api_v1_tweet, status: :created, location: @api_v1_tweet
    else
      render json: @api_v1_tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tweets/1
  def update
    if @api_v1_tweet.update(api_v1_tweet_params)
      render json: @api_v1_tweet
    else
      render json: @api_v1_tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tweets/1
  def destroy
    @api_v1_tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_tweet
      @api_v1_tweet = Api::V1::Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_tweet_params
      params.require(:api_v1_tweet).permit(:text, :comments, :likes, :retweets, :views, :user_id)
    end
end
