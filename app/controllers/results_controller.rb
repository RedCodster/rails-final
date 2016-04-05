class ResultsController < ApplicationController
  def create
    quiz = Quiz.find_by(id: params[:quiz_id])
    @result = Result.create({
      user: @current_user,
      quiz: quiz,
      score: params[:score].to_i
    })
    @result
  end
end
