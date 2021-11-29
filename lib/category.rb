class Category
  attr_reader :id, :name

  @@next_index = 1
  
  def initialize(name:)
    @id = @@next_index
    @name = name
    @@next_index += 1
  end

  CATEGORIES = [
    new(name: 'HTML'),
    new(name: 'CSS'),
    new(name: 'JavaScript'),
    new(name: 'React'),
    new(name: 'Ruby'),
    new(name: 'Rails'),
    new(name: 'Golang')
  ]

  def show
    "##{id} - #{title}"
  end
end