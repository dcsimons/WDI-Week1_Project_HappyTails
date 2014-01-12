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

end