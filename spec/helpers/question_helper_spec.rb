# spec/helpers/question_helper_spec.rb
require 'rails_helper'

describe QuestionHelper, type: :helper do
  describe '#add_answer_link' do
    let(:question) { create(:question) }

    it 'for question without answers' do
      expect(helper.add_answer_link(question)).to match(/Дать ответ/)
    end

    it 'for question with any answers' do
      create(:answer, question: question, user: question.user)
      expect(helper.add_answer_link(question)).to match(/Дать новый ответ/)
    end
  end
end