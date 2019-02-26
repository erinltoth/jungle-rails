require 'rails_helper'

RSpec.describe User, type: :model do

    subject { described_class.new(first_name: "Lola", last_name: "Dog", email: "lola@lola.com", password:"password", password_confirmation: "password")}

    describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
      expect(subject.errors.full_messages.length).to eql(0)
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password can't be blank")
    end

    it 'is not valid without a password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end

    it 'is not valid when password and password_confirmation do not match' do
      subject.password_confirmation = "loladogisbest"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Email can't be blank")
    end

    it 'is not valid without unique email' do
      User.create(first_name: "Otis", last_name: "Redding", email: "otis@dog.com",
                        password: "password", password_confirmation: "password")
      subject.email = "OTIS@DOG.COM"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Email has already been taken")
    end

    it 'is not valid with a password less than 8 characters' do
      subject.password = "1234"
      subject.password_confirmation = "1234"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password is too short (minimum is 8 characters)")
    end

    it 'is not valid without a first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("First name can't be blank")
    end

    it 'is not valid without a last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Last name can't be blank")
    end

    describe '.authenticate_with_credentials' do
      it 'returns user object if credentials are valid' do
        subject.save!
        expect(User.authenticate_with_credentials("example@example.com", "password")).to_not eql(nil)
      end
    end

    it 'returns nil if email is invalid' do
      subject.save!
      expect(User.authenticate_with_credentials("incorrect@email", "password")).to eql(nil)
    end

    it 'returns nil if password is invalid' do
      subject.save!
      expect(User.authenticate_with_credentials("example@example.com", "notcorrect")).to eql(nil)
    end

    it 'returns user object if valid email contains spaces before or after' do
      subject.save!
      expect(User.authenticate_with_credentials(" example@example.com ", "password")).to_not eql(nil)
    end

    it 'returns user object if valid email contains unmatching case characters' do
      subject.save!
      expect(User.authenticate_with_credentials("eXaMpLe@ExAmPlE.cOm", "password")).to_not eql(nil)
    end

  end

end