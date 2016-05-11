# spec/helpers/comments_helper_spec.rb
require 'rails_helper'

describe CommentsHelper, type: :helper do
  describe '#confirm_icon' do
    it 'return + if comment is not confirmed' do
      comment = create(:comment)
      expect(confirm_icon(comment)).to match(/\+/)
    end

    it 'return v if comment is confirmed' do
      comment = create(:comment, :confirmed)
      expect(confirm_icon(comment)).to match(/\u{2713}/)
    end
  end

  describe '#confirmed_at' do
    it 'return nil if comment is not confirmed' do
      comment = create(:comment)
      expect(confirmed_at(comment)).to eq(nil)
    end

    it 'return confirmed date if comment is confirmed' do
      comment = create(:comment, :confirmed)
      expect(confirmed_at(comment)).to match(/<span class=\"confirmed\">принято<\/span>/)
    end
  end

  describe '#confirm_comment_link' do
    it 'return nil if comment is not confirmed' do
      comment = create(:comment)
      expect(confirm_comment_link(comment)).to match(/<a (.*)>Принять правку<\/a>/)
    end

    it 'return confirmed date if comment is confirmed' do
      comment = create(:comment, :confirmed)
      expect(confirm_comment_link(comment)).to eq(nil)
    end
  end
end
