class Comment < ActiveRecord::Base
  attr_accessible :body, :email, :user_name
end
