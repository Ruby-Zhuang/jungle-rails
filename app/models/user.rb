class User < ActiveRecord::Base
  # gives User model authentication methods via bcrypt.
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  # two fields should receive exactly the same content
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  # authentication (class) method
  def self.authenticate_with_credentials(email, password)
    email_normalized = email.downcase.strip # Remove leading/trailing spaces and make email lowercase
    # Return: an instance of the user (if successfully authenticated), or nil
    User.find_by_email(email_normalized).authenticate(password) || nil
  end
end
