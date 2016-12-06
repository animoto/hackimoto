class User < ActiveRecord::Base
  has_many :hack_users
  has_many :hacks, :through => :hack_users

  validates :email, presence: true, length: { in: 3..100 }
  validates_uniqueness_of :email, case_sensitive: false

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      #user.provider = auth.provider
      user.email = auth.info.email
      #user.name = auth.info.name
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name      
      user.oauth_token = auth.credentials.token
      user.profile_pic = auth.info.image
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end