require 'io/console'
require_relative 'study_item'

ADD_ITEM = 1
SHOW_ITEMS= 2
SEARCH_ITEM = 3
EXIT = 4

def welcome
  puts "Bem-vindo ao Diário de Estudos!"
  puts
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

def continue
  puts "Pressione qualquer tecla para continuar"
  STDIN.getch
  puts
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

def show_items(items)
  puts
  puts "===== Itens Cadastrados ====="
  puts
  items.each { |item| item.show() }
  puts "Itens não cadastrados." if items.empty?
  puts
  continue()
end

def search_item
  puts
  puts "===== Buscando um Item ====="
  puts
  continue()
end

categories = [
  Category.new('CURSO'),
  Category.new('PALESTRA'),
  Category.new('POST'),
  Category.new('TUTORIAL ESCRITO'),
  Category.new('TUTORIAL EM VÍDEO'),
  Category.new('WORKSHOP')
]
study_items = []
welcome()

loop do
  option = menu()
  if option == ADD_ITEM
    study_items << add_item()
  elsif option == SHOW_ITEMS
    show_items(study_items)
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