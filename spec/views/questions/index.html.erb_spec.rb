# spec/views/questions/index.html.erb_spec.rb
require 'rails_helper'

describe "questions/index.html.erb", type: :view do
  describe 'for a no authenticated user' do
    it 'displays a link to sing up form' do
      render
      expect(rendered).to have_link('Регистрация')
    end

    it 'displays a link to sign in form' do
      render
      expect(rendered).to have_link('Вход')
    end
  end

  describe 'for an authenticated user' do
    let(:user) { create(:user) }

    it 'displays a name of user' do
      sign_in user
      render 
      expect(rendered).to have_content(user.name)
    end

    it 'displays a link to sign out' do
      sign_in user
      render
      expect(rendered).to have_link('Выход')
    end
  end
end
