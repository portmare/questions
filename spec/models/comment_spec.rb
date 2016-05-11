# spec/models/comment_spec.rb
require 'rails_helper'

describe Comment, type: :model do
  describe 'comment validations' do
    it 'with all attributes should be valid' do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it 'with nil body should be invalid' do
      comment = build(:comment, :nil_body)
      expect(comment).to be_invalid
    end
  end
end
