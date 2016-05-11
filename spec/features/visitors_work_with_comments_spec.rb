# spec/features/visitors_work_with_comments_spec.rb
require 'rails_helper'

feature 'Visitors work with comments', type: :feature do
  scenario 'click to #Предложить правку redirected to sign in page with no authenticated user' do
    visit root_path
    click_link 'Предложить правку'
    expect(page).to have_button('Войти')
  end

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }

  before do
    question = create(:question, user: user1)
    @answer = create(:answer, question: question, user: user2)
  end

  scenario 'click to #Предложить правку render #new action with authenticated user' do
    logged_in user3.email, user3.password

    click_link 'Предложить правку'
    expect(page).to have_content('Предложить правку')
    expect(page).to have_button('Предложить правку')
    
    body = 'Это дополнительная правка основному ответу'
    fill_in 'comment_body', with: body
    click_button 'Предложить правку'

    expect(page).to have_content(body)
    expect(page).to have_link('Принять правку')

    click_link('Принять правку')
    expect(page).to have_content('Нет прав для этой операции')
  end

  scenario 'click #Принять правку with ansers owner' do
    comment = create(:comment, answer: @answer, user: user3)
    logged_in user2.email, user2.password

    click_link 'Принять правку'
    expect(page).to have_button('Принять правку')
    expect(page).to have_field('comment_body', with: "#{@answer.body} #{comment.body}")
    
    click_button 'Принять правку'
    expect(page).to have_content(comment.body)
    expect(page).to have_content('принято')
  end
end
