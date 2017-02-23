class Question < ApplicationRecord
  validates(:statement, :presence=>true, :length=>{:minimum=>1, :maximum=>128})
  # questions <=> user 
  has_many(:answers, :dependent=>:destroy)
  has_many(:users, :through=>:answers)
  belongs_to(:poll)
  
end
