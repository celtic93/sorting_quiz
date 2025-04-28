class CurrentRoundQuestionsController < ApplicationController
  def show
    @current_question = Round.find(params[:round_id]).current_question
  end
end
