json.question do
  json.id @current_question.id
  json.text @current_question.text
end

json.answers @current_question.done_options do |option|
  json.id option.id
  json.text option.text
  json.correct option.correct
end

json.current_option do
  if @current_question.current_option.nil?
    json.nil!
  else
    json.id @current_question.current_option.id
    json.text @current_question.current_option.text
  end
end
