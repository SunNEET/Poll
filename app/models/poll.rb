class Poll < ApplicationRecord
	validates(:title, :presence=>true)
	has_many(:questions, :dependent=>:destroy)
end
