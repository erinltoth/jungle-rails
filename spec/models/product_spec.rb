require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' 
  subject { described_class.new }
  
  it 'should not be valid if name is missing' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
    
  it 'should not be valid if price is missing' do
    subject.price_cents = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if quantity is missing' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if category is missing' do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
end
