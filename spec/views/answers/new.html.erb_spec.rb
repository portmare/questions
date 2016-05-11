# spec/views/answers/new.html.erb_spec.rb
require 'rails_helper'

describe "answers/new.html.erb", type: :view do
  it 'render form' do
    question = create(:question) 
    assign(:question, question)
    assign(:answer, build(:answer, question: question, user: question.user))

    render

    expect(rendered).to have_content('Дать ответ')
    expect(rendered).to have_button('Дать ответ')
  end
end
