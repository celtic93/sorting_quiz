json.round_option do
  json.id @round_option.id
  json.text @round_option.text
  json.correct @round_option.correct
  json.correct_position @round_option.correct_position
end

json.next_option do
  if @next_option.nil?
    json.nil!
  else
    json.id @next_option.id
    json.text @next_option.text
  end
end
