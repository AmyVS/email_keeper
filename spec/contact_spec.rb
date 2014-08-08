require 'rspec'
require 'contact'

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
    expect(test_contact.emails).to eq []
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

  it 'adds a new email address to an existing contact' do
    test_contact = Contact.new('The Doctor')
    test_email = Email.new('bluebox@tardis.com')
    expect(test_contact.add_email(test_email)).to eq [test_email]
  end

  it 'removes a specific email address from a contact' do
    test_contact = Contact.new('The Doctor')
    test_email = Email.new('bluebox@tardis.com')
    test_contact.add_email(test_email)
    expect(test_contact.remove_email(test_email)).to eq []
  end

  it 'lists all emails attached to a specified contact' do
    test_contact = Contact.new('The Doctor')
    test_email1 = Email.new('bluebox@tardis.com')
    test_email2 = Email.new('wibblywobbly@timeywimey.com')
    test_contact.add_email(test_email1)
    test_contact.add_email(test_email2)
    expect(test_contact.list_emails).to eq [test_email1, test_email2]
  end
end


