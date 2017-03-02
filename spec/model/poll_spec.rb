require "rails_helper"

describe Poll, type: :model do
  
  let(:poll) { Poll.new }
  
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to have_many(:questions) }

end
