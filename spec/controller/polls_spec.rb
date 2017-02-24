require "rails_helper"

describe PollsController, type: :controller do

  login_admin

  let(:poll) { FactoryGirl.create(:poll) }

  describe '#index' do
    it 'shows the index' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    it 'shows the form' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe '#show' do
    it 'shows the question list' do
      get :show, params: { id: poll.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "#create" do
    let(:poll_params) { { title: "Create_Test" } }

    it "creates the record" do
      expect{ post :create, params: { poll: poll_params } }.to change{ Poll.all.size }.by(1)
    end

    it "redirects on success" do
      post :create, params: { poll: poll_params }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(poll_path(Poll.last))
    end

    it "renders :new on fail" do
      post :create, params: { poll: { title: "" } }
      expect(response).not_to have_http_status(302)
      expect(response).to render_template(:new)
    end

  end

  describe "#destroy" do 
    let!(:poll) { FactoryGirl.create(:poll) }

    it "deletes the record" do 
      expect{ delete :destroy, params: { id: poll.id } }.to change{ Poll.all.size }.by(-1)
    end

    it "redirects to index after destroy" do 
      delete :destroy, params: { id: poll.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "#save" do 
    let(:question) { FactoryGirl.create(:question, poll: poll) }

    it "saves the answer" do
      expect{ post :save, params: { id: poll.id, choice: question.statement  } }.to change{ Answer.all.size }.by(1)
    end

    it "redirects to show on success" do
      post :save, params: { id: poll.id, choice: question.statement }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(poll_path(Poll.last))
    end

  end

end