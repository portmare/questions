# spec/models/answer_spec.rb
require 'rails_helper'

describe Answer, type: :model do
  describe 'answer validations' do
    it 'answer with all attributes should be valid' do
      answer = build_stubbed(:answer)
      expect(answer).to be_valid
    end

    it 'answer with nil body should be invalid' do
      answer = build_stubbed(:answer, :nil_body)
      expect(answer).to be_invalid
    end
  end
end
