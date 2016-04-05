class ResultsController < ApplicationController
  def create
    quiz = Quiz.find_by(id: params[:quiz_id])
    user = User.find_by(id: params[:user_id])
    @result = Result.create({
      user: user,
      quiz: quiz,
      score: params[:score].to_i
    })
    @result
  end

  def index
    @results = Result.where(user_id: params[:user_id])
    @results
  end
end
