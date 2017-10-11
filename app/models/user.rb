class User < ApplicationRecord
  enum role: [:user, :vip, :admin]

  after_initialize :set_default_role, :if => :new_record?

  mount_uploader :avatar, AvatarUploader

  def set_default_role
    self.role ||= :user
    self.uuid ||= SecureRandom.uuid
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
