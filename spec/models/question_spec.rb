# spec/models/questions_spec.rb
require 'rails_helper'

describe Question, type: :model do
  context 'question validations' do
    it 'question with all attributes should be valid' do
      question = build_stubbed(:question)
      expect(question).to be_valid
    end

    it 'question with nil title should be invalid' do
      question = build_stubbed(:question, :nil_title)
      expect(question).to be_invalid
    end

    it 'question with nil body should be invalid' do
      question = build_stubbed(:question, :nil_body)
      expect(question).to be_invalid
    end
  end
end
