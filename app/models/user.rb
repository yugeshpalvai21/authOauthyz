class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :trackable, :omniauthable,
         :recoverable, :rememberable, :validatable

  include Roleable
  
  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_create do |user|
      user.password = Devise.friendly_token[0, 20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.confirmed_at = Time.now
    end
    unless user.confirmed?
      user.confirmed_at = Time.now
      user.save
    end
    user
  end
end
