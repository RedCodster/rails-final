class QuizzesController < ApplicationController
  before_action :authenticate_user!

  def index
    @quizzes = Quiz.all
  end

  def create
    @quiz = current_user.quizzes.new(post_params)

    if @quiz.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @post = Quiz.find_by_id(params[:id])

    if @quiz.nil?
      render json: { message: "Cannot find quiz" }, status: :not_found
    else
      @quiz.update(post_params)
    end
  end

  def show
    @quiz = Quiz.find_by_id(params[:id])

    if @quiz.nil?
      render json: { message: "Cannot find quiz" }, status: :not_found
    end
  end

  def destroy
    @quiz = Quiz.find_by_id(params[:id])

    if @quiz.nil?
      render json: { message: "Cannot find quiz" }, status: :not_found
    else
      if @quiz.destroy
        render json: { message: "Successfully deleted" }, status: :no_content
      else
        render json: { message: "Unsuccessfully deleted" }, status: :bad_request
      end
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :content, :category)
  end
end
