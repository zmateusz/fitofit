class User < ActiveRecord::Base
  has_many :tracks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable,
         :omniauthable

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.uid+"@foo.com"
      user.name = auth.info.name.present? ? auth.info.name : auth.info.nickname
      user.image = auth.info.image.present? ?  auth.info.image : "//placehold.it/50x50"
      user.password = Devise.friendly_token[0,20]
    end
  end
end
