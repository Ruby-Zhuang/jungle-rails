class User < ActiveRecord::Base
  # gives User model authentication methods via bcrypt.
  has_secure_password

  # two fields should receive exactly the same content
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
