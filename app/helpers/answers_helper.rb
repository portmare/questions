# app/helpers/answers_helper.rb
module AnswersHelper
  def answer_body(answer)
    comments = answer.comments.confirmable.map do |x|
      content_tag(:span, x.body, class: "comment#{x.id}")
    end.join(' ')
    [answer.body, comments].join(' ').html_safe
  end
end
