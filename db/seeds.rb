# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

p 'Creating questions'
q1 = Question.create(text: "Question 1")
o11 = q1.options.create(text: "Option 1", position: 1)
o12 = q1.options.create(text: "Option 2", position: 2)
o13 = q1.options.create(text: "Option 3", position: 3)
o14 = q1.options.create(text: "Option 4", position: 4)
o15 = q1.options.create(text: "Option 5", position: 5)

q2 = Question.create(text: "Question 2")
o21 = q2.options.create(text: "Option 1", position: 1)
o22 = q2.options.create(text: "Option 2", position: 2)
o23 = q2.options.create(text: "Option 3", position: 3)
o24 = q2.options.create(text: "Option 4", position: 4)
o25 = q2.options.create(text: "Option 5", position: 5)
p 'Questions created sucessfully'

p 'Creating round'
round = Round.create
rq1 = round.round_questions.create(question_id: q1.id, position: 2)
rq1.round_options.create(
  position: 1,
  option_id: o12.id,
  correct_position: 1,
  user_position: 1,
  correct: true,
  score: 0
)
rq1.round_options.create(position: 2, option_id: o15.id, correct_position: 2)
rq1.round_options.create(position: 3, option_id: o11.id, correct_position: 1)
rq1.round_options.create(position: 4, option_id: o14.id, correct_position: 3)
rq1.round_options.create(position: 5, option_id: o13.id, correct_position: 3)

rq2 = round.round_questions.create(question_id: q2.id, position: 1)
rq2.round_options.create(
  position: 1,
  option_id: o25.id,
  correct_position: 1,
  user_position: 1,
  correct: true,
  score: 0
)
rq2.round_options.create(position: 2, option_id: o23.id, correct_position: 1)
rq2.round_options.create(position: 3, option_id: o21.id, correct_position: 1)
rq2.round_options.create(position: 4, option_id: o22.id, correct_position: 2)
rq2.round_options.create(position: 5, option_id: o24.id, correct_position: 4)
p 'Round created sucessfully'
