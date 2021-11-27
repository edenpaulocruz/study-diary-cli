require 'io/console'
require_relative 'study_item'

ADD_ITEM = 1
SHOW_ITEMS= 2
SEARCH_ITEM = 3
SHOW_BY_CATEGORY = 4
DELETE_ITEM = 5
EXIT = 6

def welcome
  puts "Bem-vindo ao Diário de Estudos, seu companheiro para estudar!"
end

def menu
  puts
  puts "[#{ADD_ITEM}] Cadastrar um item para estudar"
  puts "[#{SHOW_ITEMS}] Ver todos os itens cadastrados"
  puts "[#{SEARCH_ITEM}] Buscar um item de estudo"
  puts "[#{SHOW_BY_CATEGORY}] Listar por categoria"
  puts "[#{DELETE_ITEM}] Apagar um item" 
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
  puts
  print "Digite o título do seu item de estudo: "
  title = gets.chomp()
  puts
  category = select_category()
  puts
  StudyItem.new(title, category)
end

def select_category
  puts
  @categories.each { |category| puts "##{category.id} - #{category.name}" }
  print "Escolha uma categoria: "
  choice = gets.chomp()
  category = @categories.find { |item| item.id == choice.to_i }
end

def show_items(items)
  puts
  puts "Itens não encontrados." if items.empty?
  items.each_with_index { |item, index| puts "##{index+1} - #{item.title} - #{item.category.name}" }
end

def search_items(items)
  puts
  print "Digite uma palavra para procurar: "
  word = gets.chomp().upcase
  search_result(items, word)
end

def search_result(items, search)
  if search.class == String
    search_result = items.select { |item| item.title.upcase.include?(search) }
  elsif search.class == Category
    search_result = items.select { |item| item.category == search }
  end
  puts
  puts "Foram encontrados #{search_result.length} itens."
  show_items(search_result)
end

def show_by_category(items)
  category = select_category()
  search_result(items, category)
end

def delete_item(items)
  show_items(items)
  print "Selecione o item que deseja apagar: "
  choice = gets.chomp()
  items.delete_at(choice.to_i - 1)
end

@categories = [
  Category.new(1, 'HTML'),
  Category.new(2, 'CSS'),
  Category.new(3, 'JavaScript'),
  Category.new(4, 'React'),
  Category.new(5, 'Ruby'),
  Category.new(6, 'Rails'),
  Category.new(7, 'Golang')
]
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
    search_items(study_items)
    continue()
  elsif option == SHOW_BY_CATEGORY
    show_by_category(study_items)
    continue()
  elsif option == DELETE_ITEM
    delete_item(study_items)
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