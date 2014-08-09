require './lib/contact'
require './lib/email'
require 'pry'

@selected_contact = nil
@selected_email = nil

def welcome
   puts "\n\nWelcome to your Email Keeper. Please select from the following:"
   main_menu
end

def main_menu
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
    puts "\nHave a good one!\n\n\n"
    exit
  else
    puts "\nMy apologies, I don't recognize your selection. Please try again.\n"
    main_menu
  end
end

def add_contact
  puts "\nWhat is your contact's name?\n"
  input_contact = gets.chomp
  new_contact = Contact.new(input_contact)
  new_contact.save
  @selected_contact = new_contact

  puts "\nWhat is your contact's main email address?\n"
  input_email = gets.chomp
  new_email = Email.new(input_email)
  new_contact.add_email(new_email)

  puts "\nYou've successfully added #{new_email.address} to #{new_contact.name}'s list of emails!\n\n"
  main_menu
end

def list_contacts
  puts "\nHere's a list of all of your contacts:"
  Contact.all.each_with_index { |contact, index| puts "#{index+1}. #{contact.name}" }

  puts "\n\nIf you would like to make edits to an existing contact, please enter the contact's index number."
  puts "Or, press any other key to return to the main menu."

  user_choice = gets.chomp

  if user_choice.to_i <= Contact.all.length && user_choice.to_i != 0
    @selected_contact = Contact.all.fetch(user_choice.to_i-1)
    edit_contact
  else
    main_menu
  end
end

def edit_contact
  puts "\n\nYou've selected #{@selected_contact.name}'s email list.\n"
  puts "Press 'a' to add a new email address, 'e' to edit a specific contact's email addresses,"
  puts "'r' to remove the contact, or any key to return to the main menu."

  user_choice = gets.chomp

  if user_choice == 'a'
    new_email
  elsif user_choice == 'e'
    edit_email
  elsif user_choice == 'r'
    remove_contact
  else
    puts "\nReturning to the main menu...\n\n"
    main_menu
  end
end

def new_email
  puts "\nPlease enter the new email address for your contact, #{@selected_contact.name}.\n"

  user_input = gets.chomp
  new_address = Email.new(user_input)
  @selected_contact.add_email(new_address)

  puts "\nYou've successfully added #{new_address.address} to #{@selected_contact.name}'s email list.\n\n"
  puts "Returning to the edit contact menu. \n\n"
  edit_contact
end

def edit_email
  puts "\nHere are the email addresses you have for #{@selected_contact.name}:"
  @selected_contact.list_emails
  puts "\n\n"

  puts "If you would like to remove an email, please select the email's index number."
  user_choice = gets.chomp

  if user_choice.to_i <= @selected_contact.emails.length && user_choice.to_i != 0
    @selected_email = @selected_contact.emails.fetch(user_choice.to_i-1)
    @selected_contact.remove_email(@selected_email)
  else
    puts "\nMy apologies, I was unable to understand your choice. Please try again.\n"
    edit_email
  end
  puts "\n#{@selected_email.address} has been successfully removed from #{@selected_contact.name}'s email list.\n\n"
  edit_contact
end

def remove_contact
  puts "\nAre you sure you want to remove #{@selected_contact.name} from your Email Keeper? y/n"
  user_choice = gets.chomp

  if user_choice == 'y'
    Contact.all.delete_if { |contact| contact == @selected_contact }
    puts "\n#{@selected_contact.name} has been successfully removed. Returning to the main menu...\n"
    main_menu
  elsif user_choice == 'n'
    puts "\nWhew, that was a close one! Returning to the edit contact menu...\n"
    edit_contact
  else
    puts "\nMy apologies, I don't recognize your selection. Please try again.\n"
    remove_contact
  end
end

welcome
