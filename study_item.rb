require_relative 'category'

class StudyItem
  attr_accessor :title, :category, :description, :done

  def initialize(title, category, description)
    @title = title
    @category = category
    @description = description
    @done = false
    puts "Item '#{title}' da categoria '#{category.name}' cadastrado com sucesso!"
  end
end