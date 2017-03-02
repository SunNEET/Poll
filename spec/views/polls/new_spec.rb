require 'rails_helper'

describe 'polls/new.html.erb', type: :view do
  let(:poll) { FactoryGirl.create(:poll) }
  it 'can render' do
    assign(:poll, poll)
    render
    expect(rendered).to include("Poll Title")
    expect(rendered).to include("Create a Poll")
  end
end