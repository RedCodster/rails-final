json.array! @results do |result|
  json.id result.id
  json.name result.quiz.name
  json.length result.quiz.questions.length
  json.score result.score
  json.created_at result.created_at
end