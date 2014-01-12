class Client
  #basic properties, feel free to add more
  attr_accessor :name_str, :children_num, :age_num, :pet_num, :pet_arr

  # initialize instance variables
  def initialize(name_str, children_num, age_num, pet_num, pet_arr = [])
    #implement
    @name_str = name_str
    @children_num = children_num
    @age_num = age_num
    @pet_num = pet_num
    @pet_arr = pet_arr

  end

  # Returns the client's info (name, age and pet count) as one string
  def client_info
    #implement
    client_information = "#{@name_str}   #{@age_num}   #{@pet_num}"
  end

  # Returns a string featuring elements of the pet array of animal objects. Each string is a client's pet information
  def get_pets
    if @pet_arr == []
      pet_info = "No pets in system."
    else
      pet_info = @pet_arr.inject("") do |pet_info_str, animal|
        pet_info_str << "#{animal.name_str.capitalize} (#{animal.species_str}) "
      end
    end
    return pet_info
  end

  # Checks to see if animal exists in the pet array by way of a passed animal name.  Returns TRUE if yes and FALSE if no.
  def pet_available?(pet_name)
    pet_check = 0
    @pet_arr.each do |animal|
      if pet_name == animal.name_str
        pet_check += 1
      end
    end

    if pet_check > 0
      true
    else
      false
    end
  end

  # Deletes a specified animal object by name from the pet array
  def remove_pet(pet_name)
    index_position = 0
    @pet_arr.each do |animal|
      if pet_name == animal.name_str
        index_position = @pet_arr.index(animal)
      end
    end
    @pet_arr.delete_at(index_position)
  end

end