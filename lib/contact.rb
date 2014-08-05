class Contact
  attr_reader :name, :email

  def initialize(name)
    @name = name
    @email = []
  end
end
