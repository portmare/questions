# spec/models/user_spec.rb
require 'rails_helper'

describe User, type: :model do
  context 'user validations' do
    it 'user with all attributes should be a valid' do
      user = build_stubbed(:user)
      expect(user).to be_valid
    end

    it 'user with nil name should be a invalid' do
      user = build_stubbed(:user, :nil_name)
      expect(user).to be_invalid
    end

    it 'user with different password should be a invalid' do
      user = build_stubbed(:user, :diff_password)
      expect(user).to be_invalid
    end

    it 'user with short password should be invalid' do
      user = build_stubbed(:user, :short_password)
      expect(user).to be_invalid
    end

    it 'user with incorrect email should be a invalid' do
      user = build_stubbed(:user, email: '1123')
      expect(user).to be_invalid
    end
  end
end
