require 'rails_helper'

describe 'polls/index.html.erb', type: :view do
  let(:poll) { FactoryGirl.create(:poll) }
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:polls) { Array.new(2, poll) }

  describe '#user' do
    before do
      assign(:user, user)
      assign(:polls, polls)
    end
    it 'can render' do
      render
      expect(rendered).to include("Polls list")
      expect(rendered).to include(poll.title)
    end

    it 'can not see "create" and "delete"' do
      render
      expect(rendered).not_to include("Create a new Poll")
      expect(rendered).not_to include("Delete")
    end
  end

  describe '#admin' do 
    before do
      assign(:user, admin)
      assign(:polls, polls)
    end
    it 'can render' do
      render
      expect(rendered).to include("Polls list")
      expect(rendered).to include(poll.title)
    end

    it 'can see "create" and "delete"' do
      render
      expect(rendered).to include("Create a new Poll")
      expect(rendered).to include("Delete")
    end
  end

end