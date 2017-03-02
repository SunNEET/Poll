require 'rails_helper'

describe 'polls/show.html.erb', type: :view do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:poll) { FactoryGirl.create(:poll) }
  let(:question) { FactoryGirl.create(:question, poll: poll) }
  let(:questions) { Array.new(3, question) }

  describe '#user' do
    before do
      assign(:user, user)
      assign(:poll, poll)
    end
    
    it 'can render' do 
      render
      expect(rendered).to include(poll.title)
    end

    it 'can not see "Add a question"' do
      render
      expect(rendered).not_to include("Add a question")
    end

    it 'can see questions' do
      allow(poll).to receive(:questions).and_return(questions)
      fake_answers = double()
      allow(fake_answers).to receive(:where).and_return(0)
      assign(:answers, fake_answers)
      render
      expect(rendered).to include(poll.questions.first.statement)
    end

    it 'can see results' do
      allow(poll).to receive(:questions).and_return(questions)
      fake_answers = double()
      allow(fake_answers).to receive(:where).and_return(0)
      assign(:answers, fake_answers)
      render
      expect(rendered).to include("Result")
    end

    it 'can not see links' do

    end

  end

  describe '#admin' do
    before do
      assign(:user, admin)
      assign(:poll, poll)
    end

    it 'can render' do 
      render
      expect(rendered).to include(poll.title)
    end

    it 'can see "Add a question"' do
      render
      expect(rendered).to include("Add a question")
    end

    it 'can see questions' do
      allow(poll).to receive(:questions).and_return(questions)
      fake_answers = double()
      allow(fake_answers).to receive(:where).and_return(0)
      assign(:answers, fake_answers)
      render
      expect(rendered).to include(poll.questions.first.statement)
    end

    it 'can see results' do
      allow(poll).to receive(:questions).and_return(questions)
      fake_answers = double()
      allow(fake_answers).to receive(:where).and_return(0)
      assign(:answers, fake_answers)
      render
      expect(rendered).to include("Result")
    end

    it 'can see links' do
    end

  end


end