require './lib/contact'
require './lib/email'

@selected_contact = nil

def main_menu
  puts "Welcome to your Email Keeper. Please select from the following:"
  puts "Press 'a' to add a new contact, 'l' to list all of your contacts,"
  puts "'e' to edit a contact, or 'x' to exit."

  user_choice = gets.chomp

  if user_choice == 'a'
    add_contact
  elsif user_choice == 'l'
    list_contacts
  elsif user_choice == 'e'
    edit_contact
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
  puts "\n\n"
  main_menu
end

def list_contacts
  puts "Here's a list of all of your contacts:"
  Contact.all.each_with_index { |contact, index| puts "#{index+1}. #{contact.name}" }
  puts "\n"

  main_menu
end

def edit_contact
  puts "Please enter your contact's name."

  contact_name = gets.chomp
  @selected_contact = Contact.all.select { |contact| contact.name == contact_name }.first
  puts "You've selected #{@selected_contact.name}\n"
  puts "Press 'a' to add a new email address, 'l to list a specific contact's email addresses,"
  puts "'r' to remove an email address, or any key to return to the main menu."

  user_choice = gets.chomp

  if user_choice == 'a'
    new_email
  elsif user_choice == 'l'
    list_emails
  elsif user_choice == 'r'
    remove_email
  else
    puts "Returning to the main menu..."
    main_menu
  end
end

def new_email
  puts "Please enter the new email address for your contact, #{@selected_contact.name}."

  user_input = gets.chomp
  new_address = Email.new(user_input)
  @selected_contact.add_email(new_address)

  puts "You've successfully added #{new_address.address} to #{@selected_contact.name}'s email list.\n\n"
  puts "Returning to the main menu. \n\n"
  main_menu
end

main_menu
