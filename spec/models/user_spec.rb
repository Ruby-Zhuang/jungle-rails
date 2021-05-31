require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(:first_name => "Jane", :last_name => "Doe", :email => "test@example.com", :password => "secret", :password_confirmation => "secret")
  end

  ##### VALIDATIONS #####
  describe 'Validations' do
    # Valid user
    it "should successfully saves a user given a first name, last name, email, password and password confirmation" do
      @user.save
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end

    # Valid fields
    it "should fail to create a user when first_name is not specified" do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    
    it "should fail to create a user when last_name is not specified" do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it "should fail to create a user when email is not specified" do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    # PASSWORD VALIDATIONS
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

    ##### AUTHENTICATE WITH CREDENTIALS #####
    describe '.authenticate_with_credentials' do
      it "should return an instance of the user if successfully authenticated" do
        @user.save
        authenticated_user = User.authenticate_with_credentials('test@example.com', 'secret')
        expect(authenticated_user.email).to eq @user.email
      end

      it "should return an instance of the user regardless of email case" do
        @user.save
        authenticated_user = User.authenticate_with_credentials('teSt@exAmpLe.Com', 'secret')
        expect(authenticated_user.email).to eq @user.email
      end

      it "should return an instance of the user regardless of trailing spaces before and/or after email" do
      end

      it "should return nil if unsuccessfully authenticated due to incorrect password" do
      end
      
      it "should return nil if unsuccessfully authenticated due to non-existing user" do
      end
    end


  end
end
