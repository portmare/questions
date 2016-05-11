require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'return data of questions' do
      array = Array.new
      3.times { array << create(:question, user: build_stubbed(:user)) }
      get :index
      expect(assigns(:questions)).to match_array(array)
    end
  end

  describe 'POST #create' do
    describe 'with authenticated user' do
      let(:user) { create(:user) }

      before do
        sign_in user
      end

      it 'return http create status' do
        post :create, question: attributes_for(:question, user: user)
        expect(response).to redirect_to(root_path)
      end

      it 'add question to db' do
        expect {
          post :create, question: attributes_for(:question, user: user)
        }.to change { Question.count }.by(1)
      end
    end

    describe 'with no authenticated user' do
      it 'redirected to login page' do
        post :create, question: attributes_for(:question, user: nil)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
