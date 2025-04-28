class RoundQuestion < ApplicationRecord
  belongs_to :round
  belongs_to :question

  has_many :round_options
  has_many :done_options, -> { joins(:option).where.not(user_position: nil).order('options.position') }, class_name: 'RoundOption'

  has_one :current_option, -> { where(user_position: nil).order(:position) }, class_name: 'RoundOption'

  delegate :text, to: :question
end
