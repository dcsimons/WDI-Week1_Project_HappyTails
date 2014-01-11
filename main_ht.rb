require './shelter'
require './animal'
require './client'

shelter = Shelter.new("Animal Sanctuary", "1 Doghouse Ave, San Francisco, CA")

def menu message
  puts `clear`
  puts "*** P.A.W.S. v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Add animal'
  puts '2 : Add client'
  puts '3 : Show all animals'
  puts '4 : Show all clients'
  puts '5 : Adopt an Animal to a Client'
  puts '6 : Check-in Animal from Client for Adoption'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  when "1"
    message += 'option 1'
    # 1) ask user for animal info
    # 2) use info to create instance of animal.
    # 3) display message that animal was added
    print "Animal name: "
    animal_name = gets.chomp

    print "Animal gender: "
    animal_gender = gets.chomp

    print "Animal species: "
    animal_species = gets.chomp

    puts "Does the animal have any toys? YES or NO"
    animal_toy_answer = gets.chomp.upcase
    animal_toy_arr = []
    until animal_toy_answer == "NO"
      if animal_toy_answer == "YES"
        print "Enter toy: "
        animal_toy_arr << gets.chomp
        print "Does the animal have any more toys? YES or NO"
        animal_toy_answer = gets.chomp.upcase
      else
        puts "Invalid choice.  Does the animal have any toys? YES or NO"
        animal_toy_answer = gets.chomp.upcase
      end
    end

    shelter.animal_arr << Animal.new(animal_name, animal_gender, animal_species, animal_toy_arr)
    message = "Added #{shelter.animal_arr[-1].name_str.capitalize} the #{shelter.animal_arr[-1].species_str.capitalize}"

  when "2"
    message += 'option 2'
    # 1) ask user for client info
    # 2) use info to create instance of client.
    # 3) display message that client was added
    print "Client name: "
    client_name = gets.chomp

    print "Number of children: "
    children_count = gets.chomp

    print "Client age: "
    client_age = gets.chomp

    print "Number of owned pets: "
    pet_count = gets.chomp

    shelter.client_arr << Client.new(client_name, children_count, client_age, pet_count)
    message = "Added #{shelter.client_arr[-1].name_str.capitalize}"

  when "3"
    # Display list of all animals and info
    message = "Animal list:\n"
    message += shelter.get_animals

  when "4"
    # Display a list of all clients and info
    message = "Animal list:\n"
    message += shelter.get_clients

  when "5"
    message += 'option 5'
    # Show total sqft rented
  when "6"
    message += 'option 6'
    # Show annual income of building
  else
      message += "I don't understand ..."
  end
  choice = menu message
end
