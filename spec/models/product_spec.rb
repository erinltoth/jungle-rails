require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.new(:name => "Example Category") }
  subject {
    described_class.new(name: "Example", price: 100, quantity: 10, category: category)
  }
   
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
      expect(subject.errors.full_messages.length).to eql(0)
    end

  it 'should not be valid if name is missing' do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages[0]).to eql("Name can't be blank")
  end
    
  it 'should not be valid if price is missing' do
    subject.price_cents = nil
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages[0]).to eql("Price cents is not a number")
  end

  it 'should not be valid if quantity is missing' do
    subject.quantity = nil
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages[0]).to eql("Quantity can't be blank")
  end

  it 'should not be valid if category is missing' do
    subject.category = nil
    expect(subject).to_not be_valid
    expect(subject.errors.full_messages[0]).to eql("Category can't be blank")
  end
end
end
