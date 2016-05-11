# spec/helpers/application_helper_spec.rb
require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe "#navigation_links" do
    it 'displays sign in/sign out links with no authenticated user' do
      expect(helper.navigation_links).to match(/<a (.*)Регистрация<\/a>(.*)<a (.*)Вход<\/a>/)
    end

    it 'displays user name and sign out link with authenticated user' do
      user = create(:user)
      sign_in user
      expect(helper.navigation_links).to match(Regexp.new(user.name))
      expect(helper.navigation_links).to match(/<a (.*)Выход<\/a>/)
    end
  end

  describe "#content_title" do
    it 'displays default title if :title is nil' do
      expect(helper.content_title).to match(/Вопросы/)
    end

    it 'displays extended title if :title is present' do
      helper.content_for(:title) { 'Регистрация' }
      expect(helper.content_title).to match(/Вопросы - Регистрация/)
    end
  end
end