class Round < ApplicationRecord
  has_many :round_questions
  has_many :round_options, through: :round_questions
end
