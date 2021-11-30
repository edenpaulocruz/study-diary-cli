require_relative 'category'

class StudyItem
  attr_reader :id, :title, :category, :description, :done

  @@next_index = 1

  def initialize(title:, category:, description:, done: false)
    @id = @@next_index
    @title = title
    @category = category
    @description = description
    @done = done
    @@next_index += 1
  end

  def self.select_category
    Category.show
    print 'Escolha uma categoria: '
    choice = gets.to_i
    Category.all.find { |item| item.id == choice.to_i }
  end

  def self.create
    print "\nDigite o título do seu item de estudo: "
    title = gets.chomp
    category = self.select_category
    print "\nDigite a descrição do seu item de estudo: "
    description = gets.chomp
    puts "\nItem '#{title}' da categoria '#{category.name}' cadastrado com sucesso!"
    StudyItem.new(title: title, category: category, description: description)
  end

  def to_s
    "\n##{id} - #{title} - #{category.show_name}#{' - Finalizado' if done}\n#{description}"
  end
end