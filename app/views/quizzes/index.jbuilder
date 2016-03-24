json.array! @quizzes do |quiz|
  json.id @quiz.id
  json.name @quiz.name
  json.description @quiz.description
  json.created_at quiz.created_at
end