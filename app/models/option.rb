class Option < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question 
  belongs_to :response
end
