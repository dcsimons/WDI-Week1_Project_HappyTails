class Shelter
  attr_accessor :shelter_name, :address_str, :animal_arr, :client_arr

  # initialize instance variables
  def initialize(shelter_name, address_str, animal_arr = [], client_arr = [])
    @shelter_name = shelter_name
    @address_str = address_str
    @animal_arr = animal_arr
    @client_arr = client_arr

  end

  # Returns an array. Each element is a client's contact information.
  def get_clients
    if @client_arr == []
      client_info = "No clients in system."
    else
      client_info = @client_arr.inject("") do |client_info_str, client|
        client_info_str << "#{client.name_str}   Age: #{client.age_num}   Children: #{client.children_num}   Pets: #{client.pet_num}"
      end
    end
    return client_info
      
  end

  # Returns an array. Each element is a client's contact information.
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

  # Returns the annual income. Only rented units make income.
  def calc_annual_income
    #implement
  end

  # Returns an array containing all available units
  def get_available_units
    #implement
  end

  # Returns an array containing all occupied units
  def get_rented_units
    #implement
  end

end
