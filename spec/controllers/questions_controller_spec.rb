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
    it 'return http create status' do
      post :create, question: attributes_for(:question)
      expect(response).to have_http_status(:create)
    end
  end

end
