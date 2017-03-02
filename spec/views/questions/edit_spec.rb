require 'rails_helper'

describe 'questions/edit.html.erb', type: :view do
  let(:poll) { FactoryGirl.create(:poll) }
  let(:question) { FactoryGirl.create(:question, poll: poll) }

  it 'can render' do
    assign(:poll, poll)
    assign(:question, question)
    render
    expect(rendered).to include("Statement:")
  end 

  it 'contains the statement' do
    assign(:poll, poll)
    assign(:question, question)
    render
    expect(rendered).to include(question.statement)
  end
end