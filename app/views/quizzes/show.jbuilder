json.id @quiz.id
json.name @quiz.name
json.description @quiz.description
json.created_at @quiz.created_at
json.questions @quiz.questions do |question|
  json.id question.id
  json.ask question.ask
  json.answer question.answer
  json.dummy1 question.dummy1
  json.dummy2 question.dummy2
  json.url    question.url
end