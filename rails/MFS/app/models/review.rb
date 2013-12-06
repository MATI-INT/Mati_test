# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#  user_id    :integer
#

class Review < ActiveRecord::Base
  belongs_to :user

  attr_accessible :body, :title, :user_id

  validates :body, presence: true,
            length: {minimum: 10, maximum: 5000}
  validates :title, presence: true,
            length: {minimum: 1, maximum: 50}

  def formatted_date
    created_at.strftime('%-d %B %Y %H:%M:%S')
  end
end
