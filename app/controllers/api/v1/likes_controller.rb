class Api::V1::LikesController < ApplicationController
  before_action :set_api_v1_like, only: %i[ show update destroy ]

  # GET /api/v1/likes
  def index
    @api_v1_likes = Api::V1::Like.all

    render json: @api_v1_likes
  end

  # GET /api/v1/likes/1
  def show
    render json: @api_v1_like
  end

  # POST /api/v1/likes
  def create
    @api_v1_like = Api::V1::Like.new(api_v1_like_params)

    if @api_v1_like.save
      render json: @api_v1_like, status: :created, location: @api_v1_like
    else
      render json: @api_v1_like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/likes/1
  def update
    if @api_v1_like.update(api_v1_like_params)
      render json: @api_v1_like
    else
      render json: @api_v1_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/likes/1
  def destroy
    @api_v1_like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_like
      @api_v1_like = Api::V1::Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_like_params
      params.require(:api_v1_like).permit(:users_id, :comments_id)
    end
end
