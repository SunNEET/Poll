require 'rails_helper'

describe Question, type: :model do 

  let(:question) { Question.new }

  it { is_expected.to validate_presence_of(:statement) }
  it { is_expected.to validate_length_of(:statement) }
  it { is_expected.to have_many(:answers)} 
  it { is_expected.to have_many(:users) }
  it { is_expected.to belong_to(:poll) }

  

end