require 'rspec'
require 'contact'
require 'email'

describe Contact do
  it 'initializes with a contact name' do
    new_contact = Contact.new('The Doctor')
    expect(new_contact).to be_an_instance_of Contact
  end

  it 'reads the contact name out' do
    test_contact = Contact.new('The Doctor')
    expect(test_contact.name).to eq 'The Doctor'
  end

  it 'starts as an empty array' do
    test_contact = Contact.new('The Doctor')
    expect(test_contact.email).to eq []
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Contact.all).to eq []
    end
  end

  describe '#save' do
    it 'adds a contact to an array of saved contacts' do
      test_contact = Contact.new('The Doctor')
      test_contact.save
      expect(Contact.all). to eq [test_contact]
    end
  end
end


describe Email do
  it 'initializes with an email address' do
    test_email = Email.new('bluebox@tardis.com')
    expect(test_email).to be_an_instance_of Email
  end
end
