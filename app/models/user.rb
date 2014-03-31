# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  remember_token  :string(255)
#  is_admin        :boolean
#  is_mod          :boolean
#

class User < ActiveRecord::Base
  has_secure_password

  # FIXME: emails really shouldn't be checked with a regexp
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_many :video_views
  has_many :searches

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
  
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
