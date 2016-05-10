# spec/features/visitors_signs_in_spec.rb
require 'rails_helper'

feature 'Visitors signs in' do
  let(:user) { build_stubbed(:user) }

  scenario 'with valid params' do
    logged_in(user.email, user.password)
    expect(page).to have_content(user.name)
  end

  scenario 'with invalid params' do
    logged_in(user.email, nil)
    expect(page).to have_content("Вход")
  end
end