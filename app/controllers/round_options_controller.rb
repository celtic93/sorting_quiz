class RoundOptionsController < ApplicationController
  def update
    @round_option = RoundOption.find(params[:id])
    @round_option.update(round_option_params.merge({
      correct: round_option_params[:user_position] == @round_option.correct_position
    }))
    @next_option = @round_option.round_question.current_option
  end

  private

  def round_option_params
    params.require(:round_option).permit(:user_position)
  end
end
