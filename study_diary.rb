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

welcome()

loop do
  option = menu()
  if option == ADD_ITEM
    add_item()
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