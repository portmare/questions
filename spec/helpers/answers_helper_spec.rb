# spec/helpers/answers_helper_spec.rb
require 'rails_helper'

describe AnswersHelper, type: :helper do
  describe '#answer_body' do
    let(:answer) { create(:answer) }

    it 'return answer body without unconfirmed comments' do
      expect(helper.answer_body(answer)).to match(Regexp.new(answer.body))
    end

    it 'return concatinated answer body with comfirmed comments' do
      comment = create(:comment, answer: answer, confirmed_at: "2016-05-12 00:01:01")
      expect(helper.answer_body(answer)).to match(Regexp.new("#{answer.body} <span class=\"comment(.*)\">#{comment.body}<\/span>"))
    end
  end
end