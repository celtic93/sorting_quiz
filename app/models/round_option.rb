class RoundOption < ApplicationRecord
  belongs_to :option

  delegate :text, to: :option
end
