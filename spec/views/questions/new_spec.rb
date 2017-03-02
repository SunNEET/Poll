require 'rails_helper'

describe 'questions/new.html.erb', type: :view do
  let(:poll) { FactoryGirl.create(:poll) }
  let(:question) { FactoryGirl.create(:question, poll: poll) }

  it 'can render' do
    assign(:poll, poll)
    assign(:question, question)
    render
    expect(rendered).to include("Statement:")
  end 
  
end