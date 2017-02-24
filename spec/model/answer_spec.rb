require 'rails_helper'
require 'answer'

describe Answer, type: :model do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:question) }

end