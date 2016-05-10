# spec/features/visitors_signs_up_spec.rb
require 'rails_helper'

feature 'Visitors signs up' do
  scenario 'with valid attributes' do
    sign_up attributes_for(:user)
    expect(page).to have_content('Выход')
  end

  scenario 'with invalid attributes' do
    sign_up attributes_for(:user, :nil_name)
    expect(page).to have_selector('.alert')
  end
end