require 'rspec'
require 'email'

describe Email do
  it 'initializes with an email address' do
    test_email = Email.new('bluebox@tardis.com')
    expect(test_email).to be_an_instance_of Email
  end

  it 'reads the email address out' do
    test_email = Email.new('bluebox@tardis.com')
    expect(test_email.address).to eq 'bluebox@tardis.com'
  end
end
