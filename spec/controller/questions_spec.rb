require 'rails_helper'


describe QuestionsController, type: :controller  do
  
  login_admin
  
  let(:poll) { FactoryGirl.create(:poll) }
  let(:question) { FactoryGirl.create(:question, poll: poll) }

  describe '#new' do 
    it 'shows the form' do 
      get :new, params: { poll_id: poll.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe '#edit' do
    it 'edits the form' do
      get :edit, params: { poll_id: poll.id, id: question.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end
  
  describe '#create' do 
    let(:question_param) { { poll_id: poll.id, question: { statement: "test" } } }

    it 'creates the question' do 
      expect{ post :create, params: question_param }.to change{ Question.all.size }.by(1)
    end

    it 'redirects on success' do
      post :create, params: question_param
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(poll_path(id: poll.id))
    end

    it 'renders :new on fail' do 
      post :create, params: { poll_id: poll.id, question: { statement: "" } }
      expect(response).not_to have_http_status(302)
      expect(response).to render_template(:new)
    end
  end

  describe '#update' do
    let!(:question) { FactoryGirl.create(:question, poll: poll) }

    it 'updates the question' do
      put :update, params: { poll_id: poll.id, id: question.id, question: { statement: "a%#Snslbygr" } }
      expect(Question.find(question.id).statement).to eq("a%#Snslbygr")
    end

    it 'redirects on success' do
      put :update, params: { poll_id: poll.id, id: question.id, question: { statement: "a%#Snslbygr" } }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(poll_path(id: poll.id))
    end

    it 'renders :edit on fail' do 
      put :update, params: { poll_id: poll.id, id: question.id, question: { statement: "" } }
      expect(response).not_to have_http_status(302)
      expect(response).to render_template(:edit)
    end
  end

  describe '#destroy' do
    let!(:question) { FactoryGirl.create(:question, poll: poll) }

    it 'deletes the question' do
      expect{ delete :destroy, params: { poll_id: poll.id, id: question.id } }.to change{ Question.all.size }.by(-1)
    end

    it "redirects to poll's show after destroy" do 
      delete :destroy, params: { poll_id: poll.id, id: question.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(poll_path(id: poll.id))
    end
  end
    
end