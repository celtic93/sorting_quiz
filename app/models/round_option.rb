class RoundOption < ApplicationRecord
  belongs_to :option
  belongs_to :round_question

  delegate :text, to: :option
end
