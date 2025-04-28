json.text @current_question.text

json.answers @current_question.done_options do |option|
  json.text option.text
  json.correct option.correct
end

json.current_option do
  if @current_question.current_option.nil?
    json.nil!
  else
    json.text @current_question.current_option.text
  end
end
