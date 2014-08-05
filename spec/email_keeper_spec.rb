require 'rspec'
require 'contact'

describe Contact do
  it 'initializes with a contact name' do
    new_contact = Contact.new('The Doctor')
    expect(new_contact).to be_an_instance_of Contact
  end

  it 'reads the contact name out' do
    new_contact = Contact.new('The Doctor')
    expect(new_contact.name).to eq 'The Doctor'
  end

  it 'starts as an empty array' do
    new_contact = Contact.new('The Doctor')
    expect(new_contact.email).to eq []
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Contact.all).to eq []
    end
  end
end
