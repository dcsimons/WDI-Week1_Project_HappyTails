class Animal
  #basic properties, feel free to add more
  attr_accessor :name_str, :gender_str, :species_str, :toys_arr

  # initialize instance variables
  def initialize(name_str, gender_str, species_str, toys_arr = [])
    #implement
    @name_str = name_str
    @gender_str = gender_str
    @species_str = species_str
    @toys_arr = toys_arr

  end

  # Returns the animal's info (name, age, gender and species) as one string
  def animal_info
    animal_information = "#{@name_str}   #{@age_num}   #{@gender_str}   #{@species_str}"

  end

  def animal_available?(animal_name)
    if animal_name = @name_str
      true
    else
      false
    end
  end

end