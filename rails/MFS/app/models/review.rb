class Review < ActiveRecord::Base
  attr_accessible :body, :title

  validates :body, presence: true,
            length: {minimum: 10, maximum: 5000}
  validates :title, presence: true,
            length: {minimum: 1, maximum: 50}

end
