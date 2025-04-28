class Round < ApplicationRecord
  has_many :round_questions
  has_many :round_options, through: :round_questions
  has_one :current_question, -> { where(done: false).order(:position) }, class_name: 'RoundQuestion'
end
