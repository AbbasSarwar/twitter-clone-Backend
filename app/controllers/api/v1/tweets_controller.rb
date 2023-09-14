class Api::V1::TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show update destroy ]

  # GET /api/v1/tweets
  def index
    @tweets = Tweet.all

    render json: @tweets
  end

  # GET /api/v1/tweets/1
  def show
    render json: @tweet
  end

  # POST /api/v1/tweets
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render json: @tweet, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tweets/1
  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tweets/1
  def destroy
    @tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:text, :comments, :likes, :retweets, :views, :user_id)
    end
end
