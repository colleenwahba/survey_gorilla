class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :option
  belongs_to :user_survey
end
