# app/helpers/question_helper.rb
module QuestionHelper
  def add_answer_link(question)
    name = question.answers.empty? ? 'Дать ответ' : 'Дать новый ответ'
    link_to(name, new_question_answer_path(question), remote: true, id: "add_answer_link_#{question.id}")
  end
end