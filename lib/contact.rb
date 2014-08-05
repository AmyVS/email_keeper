class Contact
  attr_reader :name, :email

  @@contacts = []

  def initialize(name)
    @name = name
    @email = []
  end

  def Contact.all
    @@contacts
  end

  def save
    @@contacts << self
  end
end
