# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  review_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  attr_accessible nil

  belongs_to :user
  belongs_to :review

  validates :user_id, presence: true
  validates :review_id, presence: true
  validates :vote_type, presence: true

  after_commit :flush_cache

  private

  def flush_cache
    Rails.cache.delete(
        self.review_id.to_s + '_votes_' +
            self.vote_type.to_s
    )
  end
end
