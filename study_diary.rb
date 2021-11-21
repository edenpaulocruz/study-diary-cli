require 'io/console'
require_relative 'study_item'

ADD_ITEM = 1
SHOW_ITEMS= 2
SEARCH_ITEM = 3
EXIT = 4

def welcome
  puts "Bem-vindo ao Diário de Estudos, seu companheiro para estudar!"
end

def menu
  puts
  puts "[#{ADD_ITEM}] Cadastrar um item para estudar"
  puts "[#{SHOW_ITEMS}] Ver todos os itens cadastrados"
  puts "[#{SEARCH_ITEM}] Buscar um item de estudo"
  puts "[#{EXIT}] Sair"
  puts
  print "Escolha uma opção: "
  gets.to_i
end

def continue
  puts
  puts "Pressione qualquer tecla para continuar"
  STDIN.getch
end

def add_item
  categories = [
    Category.new(1, 'HTML'),
    Category.new(2, 'CSS'),
    Category.new(3, 'JavaScript'),
    Category.new(4, 'React'),
    Category.new(5, 'Ruby'),
    Category.new(6, 'Rails'),
    Category.new(7, 'Golang')
  ]
  puts
  print "Digite o título do seu item de estudo: "
  title = gets.chomp()
  puts
  categories.each { |category| puts "##{category.id} - #{category.name}" }
  print "Escolha uma categoria para o seu item de estudo: "
  choice = gets.chomp()
  category = categories.find { |item| item.id == choice.to_i }
  puts
  StudyItem.new(title, category)
end

def show_items(items)
  puts
  puts "Itens não encontrados." if items.empty?
  items.each { |item| puts "#{item.title} - #{item.category.name}" }
end

def search_item(items)
  puts
  print "Digite uma palavra para procurar: "
  word = gets.chomp().upcase
  search_result = items.select { |item| item.title.upcase.include?(word) }
  show_items(search_result)
end

study_items = []
welcome()

loop do
  option = menu()
  if option == ADD_ITEM
    study_items << add_item()
    continue()
  elsif option == SHOW_ITEMS
    show_items(study_items)
    continue()
  elsif option == SEARCH_ITEM
    search_item(study_items)
    continue()
  elsif option == EXIT
    break
  else
    puts
    puts "Opção inálida! Tente novamente!"
    puts
  end
end

puts
puts "Obrigado por utilizar o Diário de Estudos. Até logo!"