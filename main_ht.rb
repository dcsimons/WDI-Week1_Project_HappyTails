require './shelter'
require './animal'
require './client'

shelter = Shelter.new("The Jungle Room", "1 Doghouse Ave")

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
  puts '7 : Show all pets adopted by clients'
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
        puts "Does the animal have any more toys? YES or NO"
        animal_toy_answer = gets.chomp.upcase
      else
        puts "Invalid choice.  Does the animal have any toys? YES or NO"
        animal_toy_answer = gets.chomp.upcase
      end
    end

    shelter.animal_arr << Animal.new(animal_name, animal_gender, animal_species, animal_toy_arr)
    message = "Added #{shelter.animal_arr.last.name_str.capitalize} the #{shelter.animal_arr.last.species_str.capitalize}"

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
    message = "Added #{shelter.client_arr.last.name_str.capitalize}"

  when "3"
    # Display list of all animals and info
    message = "Animal list:\n"
    message += shelter.get_animals

  when "4"
    # Display a list of all clients and info
    message = "Client list:\n"
    message += shelter.get_clients

  when "5"
    # Adds animal to client pet array and removes from the shelter animal array
    message += 'option 5'
    print "Name of animal to be adopted: "
    adopt_animal_name = gets.chomp

    if shelter.animal_available?(adopt_animal_name) # Checks to see if animal exists at the shelter
      print "Name of client adopting animal: "
      adopt_client_name = gets.chomp

      if shelter.client_available?(adopt_client_name) # Checks to see if client exists at the shelter
        print "Animal gender: "
        adopt_animal_gender = gets.chomp

        print "Animal species: "
        adopt_animal_species = gets.chomp

        puts "Does the animal have any toys? YES or NO"
        adopt_animal_toy_answer = gets.chomp.upcase
        adopt_animal_toy_arr = []
        until adopt_animal_toy_answer == "NO"
          if adopt_animal_toy_answer == "YES"
            print "Enter toy: "
            adopt_animal_toy_arr << gets.chomp
            puts "Does the animal have any more toys? YES or NO"
            adopt_animal_toy_answer = gets.chomp.upcase
          else
            puts "Invalid choice.  Does the animal have any toys? YES or NO"
            adopt_animal_toy_answer = gets.chomp.upcase
          end
        end

        shelter.client_arr[shelter.get_client_index(adopt_client_name)].pet_arr << Animal.new(adopt_animal_name, adopt_animal_gender, adopt_animal_species, adopt_animal_toy_arr)
        shelter.remove_animal(adopt_animal_name)
        message = "#{shelter.client_arr[shelter.get_client_index(adopt_client_name)].name_str.capitalize} adopted #{shelter.client_arr[shelter.get_client_index(adopt_client_name)].pet_arr.last.name_str.capitalize} the #{shelter.client_arr[shelter.get_client_index(adopt_client_name)].pet_arr.last.species_str.capitalize}."
      else
        message = "Client does not exist."
      end 
    else
      message = "Animal does not exist."
    end

  when "6"
    # Adds animal to shelter from client and removes animal from client pet array, if applicable
    message += 'option 6'
    print "Name of client admitting animal: "
    admit_client_name = gets.chomp

    if shelter.client_available?(admit_client_name) # Checks to see if client exists at the shelter
      print "Animal name: "
      admit_animal_name = gets.chomp

      print "Animal gender: "
      admit_animal_gender = gets.chomp

      print "Animal species: "
      admit_animal_species = gets.chomp

      puts "Does the animal have any toys? YES or NO"
      admit_animal_toy_answer = gets.chomp.upcase
      admit_animal_toy_arr = []
      until admit_animal_toy_answer == "NO"
        if admit_animal_toy_answer == "YES"
          print "Enter toy: "
          admit_animal_toy_arr << gets.chomp
          puts "Does the animal have any more toys? YES or NO"
          admit_animal_toy_answer = gets.chomp.upcase
        else
          puts "Invalid choice.  Does the animal have any toys? YES or NO"
          admit_animal_toy_answer = gets.chomp.upcase
        end
      end

      shelter.animal_arr << Animal.new(admit_animal_name, admit_animal_gender, admit_animal_species, admit_animal_toy_arr)
      message = "Admitted #{shelter.animal_arr.last.name_str.capitalize} the #{shelter.animal_arr.last.species_str.capitalize} from #{shelter.client_arr[shelter.get_client_index(admit_client_name)].name_str.capitalize}."

      # Removes the animal from the client's pet array, IF the system has record of the animal in the client's pet array
      if shelter.client_arr[shelter.get_client_index(admit_client_name)].pet_available?(admit_animal_name)
        shelter.client_arr[shelter.get_client_index(admit_client_name)].remove_pet(admit_animal_name)
      end

    else
      message = "Client does not exist."
    end

  when "7"
    # Display list of all animals and info
    message = "Adopted Pets by Client list:\n"
    message += shelter.get_client_pets

  else
      message += "I don't understand ..."
  end
  choice = menu message
end
