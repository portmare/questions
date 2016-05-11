# spec/controllers/comments_controller_spec.rb
require 'rails_helper'

describe CommentsController, type: :controller do
  describe 'with no authenticated user' do
    it 'GET #new redirected to sign in path' do
      get :new, answer_id: build_stubbed(:answer)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'POST #create redirected to sign in path' do
      post :create, answer_id: build_stubbed(:answer), comment: { body: '123' }
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'GET #edit redirected to sign in path' do
      get :edit, answer_id: build_stubbed(:answer), id: build_stubbed(:comment)
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'PATCH #update redirected to sign in path' do
      patch :update, answer_id: build_stubbed(:answer), comment: { body: '123' }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'with authenticated user' do
    let(:user1) { create(:user) }
    let(:user2) { create(:user) }
    let(:user3) { create(:user) }

    before do
      @question = create(:question, user: user1)
      @answer = create(:answer, question: @question, user: user2)
      sign_in user3
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, answer_id: @answer
        expect(response).to have_http_status(:success)
      end

      it 'assign new comment' do
        get :new, answer_id: @answer
        expect(assigns(:comment)).not_to eq(nil)
      end
    end

    describe "POST #create" do
      it "returns http success" do
        post :create, answer_id: @answer, comment: { body: '123' }
        expect(response).to redirect_to(root_path)
      end

      it 'add comment to db' do
        expect {
          post :create, answer_id: @answer, comment: { body: '123' }
        }.to change { Comment.count }.by(1)
      end
    end

    describe 'GET #edit' do
      before do
        sign_in user2
        @comment = create(:comment, answer: @answer, user: user3)
      end

      it 'returns http success' do
        get :edit, answer_id: @answer, id: @comment
        expect(response).to have_http_status(:success)
      end

      it 'assigns persistent comment' do
        get :edit, answer_id: @answer, id: @comment
        expect(assigns(:comment)).to eq(@comment)
      end

      it 'redirected to with no answer owner user' do
        sign_in user1
        get :edit, answer_id: @answer, id: @comment
        expect(response).to redirect_to(root_path)
      end
    end

    describe "PATCH #update" do
      before do
        sign_in user2
        @comment = create(:comment, answer: @answer, user: user3)
      end

      it "returns http success" do
        patch :update, answer_id: @answer, comment: { body: '123456' }
        expect(response).to have_http_status(:success)
      end

      it 'update and confirmed comment in db' do
        patch :update, answer_id: @answer, comment: { body: '123456' }
        expect(assigns(:comment).body).to eq('123456')
        expect(assigns(:comment).confirmed_at).not_to eq(nil)
      end

      it 'redirected with no answer owner user' do
        sign_in user1
        patch :update, answer_id: @answer, comment: { body: '123456' }
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
