# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  provider    :string(255)
#  uid         :string(255)
#  nickname    :string(255)
#  name        :string(255)
#  image       :text
#  profile_url :string(255)
#  token       :string(255)
#  secret      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  role        :string(255)      default("user")
#

class User < ActiveRecord::Base
  has_many :reviews#, dependent: :destroy

  #attr_accessible :image, :name, :nickname, :profile_url, :provider, :secret, :token, :uid

  has_many :votes, dependent: :destroy

  after_destroy -> {
    reviews.each do |review|
      review.user_id = 2
      review.save!
    end
  }

  def user_name
    nickname.to_s == '' ? name : nickname
  end

  def voted_for?(review)
    votes.where(review_id: review.id).any?
  end

  def self.from_omniauth(auth)
    info = auth['info']

    user = User.find_or_initialize_by_uid_and_provider(
        auth['uid'], auth['provider']
    )

    user.nickname = info['nickname']
    user.name = info['name']
    user.image = info['image']
    user.profile_url = info['urls']['Twitter']
    user.token = auth['credentials']['token']
    user.secret = auth['credentials']['secret']
    user.save
    user
  end
end
