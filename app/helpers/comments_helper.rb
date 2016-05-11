# app/helpers/comments_helper.rb
module CommentsHelper
  def confirm_icon(comment)
    comment.confirmed_at ? "\u{2713}" : "+"
  end

  def confirmed_at(comment)
    " #{content_tag(:span, 'принято', class: 'confirmed')} #{comment.confirmed_at}" if comment.confirmed_at 
  end

  def confirm_comment_link(comment)
    link_to('Принять правку', edit_question_answer_comment_path(comment.question, comment.answer, comment)) unless comment.confirmed_at
  end
end
