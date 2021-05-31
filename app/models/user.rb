class User < ActiveRecord::Base
  # gives User model authentication methods via bcrypt.
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  # two fields should receive exactly the same content
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
