require 'statistics2'
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
  has_many :votes, dependent: :destroy

  dragonfly_accessor :image

  attr_accessible :body, :title, :image

  validates :body, presence: true,
            length: {minimum: 10, maximum: 5000}
  validates :title, presence: true,
            length: {minimum: 1, maximum: 50}
  validates_size_of :image, maximum: 3.megabytes
  validates_property :format,
                     of: :image, case_sensitive: false,
                     in: ['jpeg', 'png', 'gif', 'jpg',
                     'rar', 'zip', 'doc', 'docx', 'txt']

  after_commit :flush_cache

  def formatted_date
    created_at.strftime('%-d %B %Y %H:%M:%S')
  end

  def votes_of_type(type)
    Rails.cache.fetch(self.id.to_s + '_votes_' + type.to_s) {
      votes.where(vote_type: type).count
    }
  end

  def summary_rating
    vote_up = self.votes_of_type('up')
    vote_down = self.votes_of_type('down')
    ci_lower_bound(vote_up, vote_up + vote_down, 0.95)
  end

  def ci_lower_bound(pos, n, confidence = 0.95)
    if n == 0
      0.0
    else
      z = Statistics2.pnormaldist(1 - (1 - confidence) / 2)
      phat = 1.0 * pos / n
      (phat + z * z / (2 * n) - z * Math.sqrt((phat * (1 - phat) + z * z / (4 * n)) / n)) /
          (1 + z * z / n)
    end
  end

  def self.all_cached
    Rails.cache.fetch('all_reviews') {
      order('created_at DESC')
    }
  end

  private

  def flush_cache
    Rails.cache.delete('all_reviews')
  end
end
