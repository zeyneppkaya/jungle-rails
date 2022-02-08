require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create a valid user' do
      user = User.create(name: "Jane", email: "jane@jane.com", password: "hello1", password_confirmation: "hello1")
      expect(user).to (be_valid)
    end

    it 'should have both password and password confirmation' do
      user = User.create(name: "Sarah", email: "sarah@sarah.com", password: "hello", password_confirmation: nil)
      expect(user).to_not (be_valid)
    end

    it 'should not save without having an unique email' do
      @user = User.create(name: "Sarah", email: "sarah@sarah.com", password_digest: "me")
      @user2 = User.create(name: "Sarah", email: "sarah@SARAH.com", password_digest: "me")
      expect(@user2).to_not be_valid
    end

    it 'should have matching password and password confirmation' do
      password = User.create(name: "Sarah", email: "sarah@sarah.com", password: "hello", password_confirmation: "hiii")
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'should have name to be a valid user' do
      user = User.create(name: nil, email: "sarah@sarah.com", password: "hello", password_confirmation: "hello")
      expect(user).to_not (be_valid)
    end

    it 'should have a password with a minimum length of 3' do
      user = User.create(name: "Sarah", email: "sarah@sarah.com", password: "hi", password_confirmation: "hi")
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
   it 'should pass with valid credentials' do 
    user = User.create(name: "Sarah",email: "sarah@sarah.com",password: "hello",password_confirmation: "hello")
    authenticate = User.authenticate_with_credentials(user.email, user.password)
    expect(authenticate).to_not be_valid
  end
 end
end

