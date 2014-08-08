class Contact
  attr_reader :name, :emails

  @@contacts = []

  def initialize(name)
    @name = name
    @emails = []
  end

  def Contact.all
    @@contacts
  end

  def save
    @@contacts << self
  end

  def add_email(address)
    @emails << address
  end

  def remove_email(address)
    @emails.delete_if { |email| email == address }
  end

  def list_emails
    @emails.each_with_index do |email, index|
      puts "#{index+1}. #{email.address}"
    end
  end
end
