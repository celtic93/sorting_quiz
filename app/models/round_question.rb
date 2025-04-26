class RoundQuestion < ApplicationRecord
  belongs_to :round
  belongs_to :question

  has_many :round_options
end
