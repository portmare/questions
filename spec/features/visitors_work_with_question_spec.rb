# spec/features/visitors_works_with_question_spec.rb
require 'rails_helper'

feature 'Visitors work with questions', type: :feature do
  scenario 'click to #Задать вопрос redirected to sign in page with no authenticated user' do
    visit root_path
    click_link 'Задать вопрос'
    expect(page).to have_button('Войти')
  end

  let(:user) { create(:user) }

  scenario 'click to #Задать вопрос redirected to sign in page with authenticated user' do
    logged_in user.email, user.password
    
    click_link 'Задать вопрос'
    expect(page).to have_content('Заголовок вопроса')
    expect(page).to have_content('Подробное описание ситуации')
    expect(page).to have_button('Задать вопрос')

    title, body = *['Первый вопрос', 'Подробное описание вопроса']
    fill_in 'question_title', with: title
    fill_in 'question_body', with: body
    click_button 'Задать вопрос'

    expect(page).to have_content(title)
    expect(page).to have_content(body)
  end
end