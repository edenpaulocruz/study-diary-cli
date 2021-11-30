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

  def self.create
    categories = Category.all
    puts
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    puts "\n-------------------------------------------------------------"
    puts categories
    puts "-------------------------------------------------------------\n"
    print 'Escolha uma categoria: '
    choice = gets.to_i
    category = categories.find { |item| item.id == choice.to_i }
    print "\nDigite a descrição do seu item de estudo: "
    description = gets.chomp
    puts "\nItem '#{title}' da categoria '#{category.name}' cadastrado com sucesso!"
    StudyItem.new(title: title, category: category, description: description)
  end

  def to_s
    "\n##{id} - #{title} - #{category.show_name}#{' - Finalizado' if done}\n#{description}"
  end
end