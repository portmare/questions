# spec/controllers/answers_controller_spec.rb
require 'rails_helper'

describe AnswersController, type: :controller do
  describe 'with no authenticated user' do
    it 'GET #new redirected to sign in path' do
      get :new, question_id: build_stubbed(:question)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'POST #create redirected to sign in path' do
      post :create, answer: attributes_for(:answer), question_id: build_stubbed(:question)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'with authenticated user' do
    let(:user) { create(:user) }
    let(:question) { create(:question, user: user) }

    before do
      sign_in user
    end

    describe 'GET #new' do
      it 'returns http success' do
        get :new, question_id: question
        expect(response).to have_http_status(:success)
      end

      it 'assign new answer' do
        get :new, question_id: question
        expect(assign(:answer)).to eq(Answer.new)
      end
    end

    describe 'POST #create' do
      it 'redirect to root path' do
        post :create, answer: attributes_for(:answer), question_id: question
        expect(response).to redirect_to(root_path)
      end

      it 'add answer to db' do
        expect {
          post :create, answer: attributes_for(:answer), question_id: question
        }.to change { Answer.count }.by(1)
      end
    end
  end

end
