class Shelter
  attr_accessor :shelter_name, :address_str, :animal_arr, :client_arr

  # initialize instance variables
  def initialize(shelter_name, address_str, animal_arr = [], client_arr = [])
    @shelter_name = shelter_name
    @address_str = address_str
    @animal_arr = animal_arr
    @client_arr = client_arr

  end

  # Returns a string featuring elements of the client object array. Each string is a client's contact information.
  def get_clients
    if @client_arr == []
      client_info = "No clients in system.\n"
    else
      client_info = @client_arr.inject("") do |client_info_str, client|
        client_info_str << "#{client.name_str}   Age: #{client.age_num}   Children: #{client.children_num}\n"
      end
    end
    return client_info
      
  end

  # Returns a string featuring elements of the animal object array. Each string is a client's contact information.
  def get_animals
    if @animal_arr == []
      animal_info = "No animals in system.\n"
    else
      animal_info = @animal_arr.inject("") do |animal_info_str, animal|
        animal_info_str << "#{animal.name_str}   Gender: #{animal.gender_str}   Species: #{animal.species_str.capitalize}\n"
      end
    end
    return animal_info
      
  end

  # Checks to see if animal exists in the animal array by way of a passed animal name.  Returns TRUE if yes and FALSE if no.
  def client_available?(client_name)
    client_check = 0
    @client_arr.each do |client|
      if client_name == client.name_str
        client_check += 1
      end
    end

    if client_check > 0
      true
    else
      false
    end
  end


  # Checks to see if animal exists in the animal array by way of a passed animal name.  Returns TRUE if yes and FALSE if no.
  def animal_available?(animal_name)
    animal_check = 0
    @animal_arr.each do |animal|
      if animal_name == animal.name_str
        animal_check += 1
      end
    end

    if animal_check > 0
      true
    else
      false
    end
  end

  # Searches the client array for the client name and returns the index position of that client in the client array
  def get_client_index(client_name)
    index_position = 0
    @client_arr.each do |client|
      if client_name == client.name_str
        index_position = @client_arr.index(client)
      end
    end
    return index_position
  end

  # Deletes a specified animal object by name from the animal object array
  def remove_animal(animal_name)
    index_position = 0
    @animal_arr.each do |animal|
      if animal_name == animal.name_str
        index_position = @animal_arr.index(animal)
      end
    end
    @animal_arr.delete_at(index_position)
  end

  # Returns a string featuring elements of the client object array and any elements in the client pet array
  def get_client_pets
    if @client_arr == []
      client_info = "No clients in system.\n"
    else
      client_info = @client_arr.inject("") do |client_info_str, client|
        client_info_str << "#{client.name_str} pets: #{client.get_pets}\n"
      end
    end
    return client_info    
  end

end
