class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]

  # GET /api/v1/comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /api/v1/comments/1
  def show
    render json: @comment
  end

  # POST /api/v1/comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text, :users_id)
    end
end
