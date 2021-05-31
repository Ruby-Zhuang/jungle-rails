require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(:first_name => "Jane", :last_name => "Doe", :email => "test@example.com", :password => "secret", :password_confirmation => "secret")
    end

    it "should successfully saves a user given a first name, last name, email, password and password confirmation" do
      @user.save
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end
  end
end
