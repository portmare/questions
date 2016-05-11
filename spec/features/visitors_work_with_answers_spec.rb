# spec/features/visitors_work_with_answers_spec.rb
require 'rails_helper'

feature 'Visitors work with answers', type: :feature do
  scenario 'click to #Дать ответ redirected to sign in page with no authenticated user' do
    visit root_path
    click_link 'Дать ответ'
    expect(page).to have_button('Войти')
  end

  let(:user) { create(:user) }

  before do
    create(:question, user: user)
  end

  scenario 'click to #Дать ответ render #new action with authenticated user' do
    logged_in user.email, user.password

    click_link 'Дать ответ'
    expect(page).to have_content('Дать ответ')
    expect(page).to have_button('Дать ответ')
    
    body = 'Это основной ответ заданному вопросу'
    fill_in 'answer_body', with: body
    click_button 'Дать ответ'

    expect(page).to have_content(body)
  end
end