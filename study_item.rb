require_relative 'category'

class StudyItem
  attr_accessor :title, :category

  def initialize(title, category)
    @title = title
    @category = category
    puts "Item '#{title}' da categoria '#{category.name}' cadastrado com sucesso!"
  end
end