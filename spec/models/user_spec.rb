require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @user = User.new(:first_name => "Jane", :last_name => "Doe", :email => "test@example.com", :password => "secret", :password_confirmation => "secret")
    end

    # Valid user
    it "should successfully saves a user given a first name, last name, email, password and password confirmation" do
      @user.save
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end

    # Password Validations
    describe 'Password' do
      it "should fail to create a user when password is not specified" do
        @user.password = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "should fail to create a user when password_confirmation is not specified" do
        @user.password_confirmation = nil
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
      end

      it "should fail to create a user when password and password_confirmation do not match" do
        @user.password_confirmation = "Different Password"
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "should fail to create a user when password and password_confirmation are less than the required length" do
        @user.password = "Short"
        @user.save
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
    end




  end
end
