require_relative 'study_item'

ADD_ITEM = 1
SHOW_ITEMS= 2
SEARCH_ITEM = 3
EXIT = 4

def welcome
  puts "Bem-vindo ao Diário de Estudos!"
end

def menu
  puts "[#{ADD_ITEM}] Cadastrar um item para estudar"
  puts "[#{SHOW_ITEMS}] Ver todos os itens cadastrados"
  puts "[#{SEARCH_ITEM}] Buscar um item de estudo"
  puts "[#{EXIT}] Sair"
  puts
  print "Escolha uma opção: "
  gets.to_i
end

def add_item
  puts
  puts "===== Cadastro de Item ====="
  puts
  puts "Digite o título do item: "
  title = gets.chomp().upcase
  puts
  puts "Digite a categoria: "
  category =  gets.chomp().upcase
  puts
  puts "#{category} CADASTRADO COM SUCESSO!"
  puts
  return StudyItem.new(title, category)
end

def show_items
  puts
  puts "===== Itens Cadastrados ====="
  puts
end

def search_item
  puts
  puts "===== Buscando um Item ====="
  puts
end

categories = [
  Category.new('Curso'),
  Category.new('Palestra'),
  Category.new('Post'),
  Category.new('Tutorial escrito'),
  Category.new('Tutorial em vídeo'),
  Category.new('Workshop')
]
study_items = []
welcome()
p study_items

loop do
  option = menu()
  if option == ADD_ITEM
    study_items << add_item()
  elsif option == SHOW_ITEMS
    show_items()
  elsif option == SEARCH_ITEM
    search_item()
  elsif option == EXIT
    break
  else
    puts
    puts "Opção inálida! Tente novamente!"
    puts
  end
end

puts
puts "Obrigado por utilizar o CookBook. Até logo!"