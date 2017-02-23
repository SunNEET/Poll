require "rails_helper"

describe PollsController, type: :controller do

  login_admin

  before(:all) do
    @poll_1 = Poll.create(title: "Test_Poll_1")
    @poll_2 = Poll.create(title: "Test_Poll_2")
  end

  it '#index' do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it '#nex' do
    get :new
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end

  describe "#create" do
    before(:all) do
      @poll_params = {title: "Create_Test"}
    end

    it "creates record" do
      expect{ post :create, params: { poll: @poll_params } }.to change{Poll.all.size}.by(1)
    end

    it "redirect on success" do
      post :create, params: { poll: @poll_params }
      expect(response).not_to have_http_status(200)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(poll_path(Poll.last))
    end
  end

  describe "#destroy" do 
    before(:each) do 
      @poll_3 = @poll_2 || Poll.create(title: "Test_Poll_3")
    end

    it "delete record" do 
      expect{ delete :destroy, params: {id: @poll_2.id, } }.to change{Poll.all.size}.by(-1)
    end

    it "redirect_to index after destroy" do 
      delete :destroy, params: { id: @poll_3.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "#save" do 

    if "save record" do

    end

  end

end