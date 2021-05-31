class User < ActiveRecord::Base
  # gives User model authentication methods via bcrypt.
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  # two fields should receive exactly the same content
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # authentication (class) method, eeturn: an instance of the user (if successfully authenticated), or nil
  def self.authenticate_with_credentials(email, password)
    email_normalized = email.downcase.strip # Remove leading/trailing spaces and make email lowercase
    user = User.find_by_email(email_normalized)
    user && user.authenticate(password) || nil # check if user exists before authenticating password
  end
end
