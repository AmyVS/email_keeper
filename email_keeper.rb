require './lib/contact'
require './lib/email'

def main_menu
  puts "Welcome to your Email Keeper. Please select from the following:"
  puts "Press 'a' to add a new contact, 'l' to list all of your contacts,"
  puts "or 'x' to exit."

  user_choice = gets.chomp

  if user_choice == 'a'
    add_contact
  elsif user_choice == 'l'
    list_contacts
  elsif user_choice == 'x'
    puts "Have a good one!"
    exit
  else
    puts "My apologies, I don't recognize your selection. Please try again."
    main_menu
  end
end

def add_contact
  puts "What is your contact's name?"
  input_contact = gets.chomp
  new_contact = Contact.new(input_contact)
  new_contact.save

  puts "What is your contact's main email address?"
  input_email = gets.chomp
  new_email = Email.new(input_email)
  new_contact.add_email(new_email)

  puts "You've successfully added #{new_email.address} to #{new_contact.name}'s list of emails!"
  main_menu
end

main_menu
