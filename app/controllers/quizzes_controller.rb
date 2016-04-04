class QuizzesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @quizzes = Quiz.all
  end

  def create
    @quiz = current_user.quizzes.new(quiz_params)

    if @quiz.save
      # render success in Jbuilder
    else
      render json: { message: "400 Bad Request" }, status: :bad_request
    end
  end

  def update
    @quiz = Quiz.find_by(id: params[:id])

    if @quiz.nil?
      render json: { message: "Cannot find quiz" }, status: :not_found
    else
      # Update quiz attribures and also ALL questions in bulk
      # This works because:
      # - I have added accepts_nested_attributes_for in quiz.rb
      # - I have declare all whitelisted parameters for quiz and the nested questions in quiz_params
      #   (See the bottom of this file)
      @quiz.update(quiz_params)
    end
    # By default, this will using update.jbuilder to render the updated quiz object as json and then return it
  end

  def show

    @quiz = Quiz.includes(:questions).find_by_id(params[:id])

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

  # Using Strong Parameters to define whitelisted attributes.
  # Rails requires the convention of <name_of_nested_associations>_attributes so we also need to 
  # modify the JSON data at the Angular side. 
  def quiz_params
    params.permit(:name, :description, questions_attributes: [:id, :ask, :answer, :dummy1, :dummy2])
  end
end
