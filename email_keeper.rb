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

main_menu
