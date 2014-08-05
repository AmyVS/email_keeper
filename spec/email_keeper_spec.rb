require 'rspec'
require 'contact'

describe Contact do
  it 'initializes with a contact name' do
    new_contact = Contact.new('The Doctor')
    expect(new_contact).to be_an_instance_of Contact
  end
end
