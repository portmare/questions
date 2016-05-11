# spec/views/questions/index.html.erb_spec.rb
require 'rails_helper'

describe "questions/index.html.erb", type: :view do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  before do
    assign(:questions, [question])
  end

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

  describe 'displays content' do
    it 'displays with no questions a default block' do
      assign(:questions, [])
      render
      expect(rendered).to have_content('Вопросов пока нет')
    end

    it 'displays questions title and body with one question' do
      render
      expect(rendered).to have_content(question.title)
      expect(rendered).to have_content(question.body)
    end
  end

  describe 'link to add question' do
    it 'displays for all' do
      render
      expect(rendered).to have_link('Задать вопрос')
    end
  end
end
