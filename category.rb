class Category
  attr_reader :id
  attr_accessor :name
  
  def initialize(id, name)
    @id = id
    @name = name
  end
end